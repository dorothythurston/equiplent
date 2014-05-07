class AddItemTypeToItem < ActiveRecord::Migration
  def change
    add_column :items, :item_type, :string, null: false
  end
end
