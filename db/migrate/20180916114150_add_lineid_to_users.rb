class AddLineidToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :lineid, :string
  end
end
