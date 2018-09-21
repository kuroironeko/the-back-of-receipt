class Product < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :number, presence: true
  validates :name, presence: true
  validates :state, presence: true
  enum state: { request: 0, purchase: 1, consume: 3 }
  after_save :send_requests_emails

  def self.sum_of_request(products_index_id)
    sum = 0
    Product.all.where(name: products_index_id).each do |product|
      case product.state
      when 'request'
        sum += product.number
      when 'purchase'
        sum -= product.number
      end
    end
    sum
  end

  def send_requests_emails
    User.where(group_id: User.current.group_id).each do |user|
      UserMailer.requests_email(user).deliver_later
    end
  end
end
