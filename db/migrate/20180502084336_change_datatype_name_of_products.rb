class ChangeDatatypeNameOfProducts < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :name, 'integer USING CAST(name as integer)'
  end
end
