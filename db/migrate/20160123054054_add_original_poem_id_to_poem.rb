class AddOriginalPoemIdToPoem < ActiveRecord::Migration
  def change
    add_column :poems, :original_poem_id, :integer, index: true, after: :show
  end
end
