class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mobile, :string
    add_column :users, :is_admin, :boolean, :boolean => false
  end
end
