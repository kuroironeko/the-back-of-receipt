class Product < ApplicationRecord
  belongs_to :user
  validates :number, presence: true
  validates :name, presence: true
end
