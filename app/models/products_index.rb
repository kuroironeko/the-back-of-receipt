class ProductsIndex < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
