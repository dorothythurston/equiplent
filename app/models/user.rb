class User < ActiveRecord::Base
  include Clearance::User

  belongs_to :profile, polymorphic: true
  has_many :reservations, dependent: :destroy
  has_many :items, through: :reservations

  TYPES = ['brown student', 'guest']

  def open_reservations
    reservations.where(reservation_status: "reserved")
  end

  def pending_reservations
    reservations.where(reservation_status: "current")
  end
end
