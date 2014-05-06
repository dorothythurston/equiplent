class AddUrltoItem < ActiveRecord::Migration
  def change
    add_column :items, :url, :string
  end
end
