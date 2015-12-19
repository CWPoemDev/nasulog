class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :name, :text
      t.column :google_uid, :text
      t.column :image_url, :text
      t.column :email, :text
      t.timestamps null: false
    end
  end
end
