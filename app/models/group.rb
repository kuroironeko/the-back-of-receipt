class Group < ApplicationRecord
  has_many :products
  has_many :products_indices
  validates :name, presence: true , uniqueness: true
end
