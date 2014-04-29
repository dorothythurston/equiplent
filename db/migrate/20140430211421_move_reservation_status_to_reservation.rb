class MoveReservationStatusToReservation < ActiveRecord::Migration
  def change
    remove_column :items, :reservation_status
    add_column :reservations, :reservation_status, :string, null: false, default: "current"
  end
end
