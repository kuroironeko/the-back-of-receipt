class AddGroupIdToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :group_id, :integer
  end
end
