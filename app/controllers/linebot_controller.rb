class LinebotController < ApplicationController
  require 'line/bot'

  protect_from_forgery except: [:callback]

  def client
    @client ||= Line::Bot::Client.new do |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNELTOKEN']
    end
  end

  def callback
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      error 400 do 'Bad Request' end
    end

    events = client.parse_events_from(body)

    events.each do |event|
      lineid = event['source']['userId']
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          user = User.find_by(lineid: lineid)
          message_text = event.message['text']
          if user.nil? && message_text.include?('@')
            actions0 = {
              type: 'postback',
              label: 'はい',
              data: message_text
            }
            actions1 = {
              type: 'postback',
              label: 'いいえ',
              data: message_text
            }
            actions = [
              actions0,
              actions1
            ]
            template = {
              type: 'confirm',
              text: "あなたのメールアドレスは#{message_text}ですか？",
              actions: actions
            }
            message = {
              type: 'template',
              altText: 'alttext',
              template: template
            }
            client.reply_message(event['replyToken'], message)
          elsif user.nil?
            message = {
              type: 'text',
              text: 'ユーザーを確認するため、登録済のメールアドレスを入力してください。'
            }
            client.reply_message(event['replyToken'], message)
          end
        end
      when Line::Bot::Event::Postback
        user = User.find_by(email: event['postback']['data'])
        if user.nil?
          message = {
            type: 'text',
            text: 'メールアドレスが一致しません。もう一度入力してください。'
          }
        elsif !user.lineid.nil?
          message = {
            type: 'text',
            text: 'このメールアドレスは、Lineアカウントと既に紐づけられています。'
          }
        else
          user.lineid = lineid
          user.save
          message = {
            type: 'text',
            text: 'メールアドレスが一致しました。ようこそ！'
          }
        end
        client.reply_message(event['replyToken'], message)
      end
    end
    'OK'
  end

  def push_shopping_list
    text = ''
    ProductsIndex.where(group_id: current_user.group_id).each do |product|
      text << "#{product.name}: #{Product.sum_of_request(product.id)}\n"
    end
    message = {
      type: 'text',
      text: text
    }
    users = User.where(group_id: current_user.group_id)
    users.each { |user| client.push_message(user.lineid, message) unless user.lineid.nil? }
  end
end
