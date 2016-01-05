class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :poem_id
      t.string :highlight

      t.timestamps null: false
    end
  end
end
