class ChangeItemTypeToCategory < ActiveRecord::Migration
  def change
    rename_column :items, :item_type, :category
  end
end
