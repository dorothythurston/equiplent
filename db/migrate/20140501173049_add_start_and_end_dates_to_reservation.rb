class AddStartAndEndDatesToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :begins_at, :datetime, null: false
    add_column :reservations, :ends_at, :datetime, null: false
  end
end
