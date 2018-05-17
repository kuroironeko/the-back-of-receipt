# class for whole app
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def default_url_options(options = {})
    {locale: I18n.locale}.merge options
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
 
  def check_group
    redirect_to(root_url) if !(current_user.group_id == params[:group_id].to_i)
  end
end
