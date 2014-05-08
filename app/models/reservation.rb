class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates :begins_at, presence: true
  validates :ends_at, presence: true

  validates_with DateChecker

  TYPES = ['approved', 'pending', 'current', 'closed']

  def self.almost_due(warning_time)
    where("ends_at > ?", warning_time).
      where.not(reservation_status: 'closed').
      distinct
  end

  def current_reservation?
    reservation_status == "approved"
  end

  def pending_reservation?
    reservation_status == "pending"
  end

  def open
    reservation_status != "closed"
  end
end
