class ChangeNewReservationDefault < ActiveRecord::Migration
  def change
    change_column :reservations, :reservation_status, :string, default: "pending", null: false
  end
end
