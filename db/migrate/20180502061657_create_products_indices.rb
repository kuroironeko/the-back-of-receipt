class CreateProductsIndices < ActiveRecord::Migration[5.1]
  def change
    create_table :products_indices do |t|
      t.string :name

      t.timestamps
    end
  end
end
