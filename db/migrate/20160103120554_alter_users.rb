class AlterUsers < ActiveRecord::Migration
  def change
    change_column :users, :name, :string
    change_column :users, :email, :string
  end
end
