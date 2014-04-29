class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id, null: false
      t.integer :item_id, null: false

      t.timestamps
    end
  end
end
