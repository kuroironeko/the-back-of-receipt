class CreateProductsIndices < ActiveRecord::Migration[5.1]
  def change
    create_table :products_indices do |t|
      t.string :name
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
