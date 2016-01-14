class ChangeTitleColumnTypeToPoem < ActiveRecord::Migration
  def up
    change_column :poems, :title, :string
  end

  def down
    change_column :poems, :title, :text
  end
end
