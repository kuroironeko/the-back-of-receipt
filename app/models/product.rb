class Product < ApplicationRecord
  belongs_to :user
  validates :number, presence: true
  validates :name, presence: true
  validates :state, presence: true
  enum state: { request:0, purchase:1, consume:3 }

  def self.sum_of_request(products_index_id)
    sum = 0
    Product.all.where(name: products_index_id).each do |product|
      case product.state
      when "request"
        sum += product.number
      when "purchase"
        sum -= product.number
      end
    end
  return sum
  end
end
