class Product < ApplicationRecord
  belongs_to :user
  validates :number, presence: true
  validates :name, presence: true
  validates :state, presence: true
  enum state: { request:0, purchase:1, consume:3 }
end
