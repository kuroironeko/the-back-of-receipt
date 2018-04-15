class RenamePriceColumnToProducts < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :Price, :price
  end
end
