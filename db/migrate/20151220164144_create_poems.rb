class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.column :user_id, :integer
      t.column :title, :text
      t.column :description, :text
      t.column :show, :boolean

      t.timestamps null: false
    end
  end
end
