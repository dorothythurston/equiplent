class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.integer :item_id, null: false
      t.integer :pair_item_id, null: false

      t.timestamps
    end
  end
end
