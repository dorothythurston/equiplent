class Item < ActiveRecord::Base
 has_many :reservations, dependent: :destroy

 def reservation
   reservations.where(reservation_status: "current").first
 end

 def reserved?
   reservation.present?
 end

 def reserved_by?(user)
  reserved? && reservation.user == user
 end
end
