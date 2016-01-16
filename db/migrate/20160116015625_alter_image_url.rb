class AlterImageUrl < ActiveRecord::Migration
  def change
    rename_column :users, :image_url, :icon_url
  end
end
