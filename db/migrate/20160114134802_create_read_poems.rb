class CreateReadPoems < ActiveRecord::Migration
  def change
    create_table :read_poems do |t|
      t.integer :poem_id
      t.integer :user_id

      t.timestamps null: false

      t.index :poem_id
      t.index :user_id
    end
  end
end
