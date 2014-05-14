class AddNullFalseToItemColumns < ActiveRecord::Migration
  def change
    change_column :items, :name, :string, null: false
    change_column :items, :url, :string, null: false
  end
end
