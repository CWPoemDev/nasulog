class AddDeletedAtColumnToPoem < ActiveRecord::Migration
  def change
    add_column :poems, :deleted_at, :datetime, null:true, default: nil, after: :updated_at
  end
end
