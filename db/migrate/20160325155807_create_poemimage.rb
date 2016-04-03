class CreatePoemimage < ActiveRecord::Migration[5.0]
  def change
    create_table :poemimages do |t|
      t.integer :poem_id
      t.string :image

      t.timestamps null: false
    end
  end
end
