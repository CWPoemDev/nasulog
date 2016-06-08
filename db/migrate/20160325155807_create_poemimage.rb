class CreatePoemimage < ActiveRecord::Migration[5.0]
  def change
    create_table :poemimages do |t|
      t.references :poem
      t.string :image

      t.timestamps null: false
    end
  end
end
