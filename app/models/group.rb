class Group < ApplicationRecord
  has_many :products
  has_many :products_indices
end
