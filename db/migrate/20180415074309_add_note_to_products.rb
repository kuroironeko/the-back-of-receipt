class AddNoteToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :note, :text
  end
end
