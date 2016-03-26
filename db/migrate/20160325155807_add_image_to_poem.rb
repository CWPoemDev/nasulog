class AddImageToPoem < ActiveRecord::Migration[5.0]
  def change
    add_column :poems, :image, :string, after: :original_poem_id
  end
end
