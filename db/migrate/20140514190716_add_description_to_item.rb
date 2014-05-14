class AddDescriptionToItem < ActiveRecord::Migration
  def change
    add_column :items, :description, :string, null: false
  end
end
