class AddRequestGroupToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :request_group, :integer
  end
end
