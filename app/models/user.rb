class User < ActiveRecord::Base
  include Clearance::User

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :telephone, presence: true
  validates :profile_type, presence: true

  belongs_to :profile, polymorphic: true

  has_many :reservations, dependent: :destroy
  has_many :items, through: :reservations

  TYPES = ['brown student', 'guest']

  def self.paginated(page, per)
    page(page).per(per)
  end

  def name
    "#{first_name} #{last_name}"
  end

  def open_reservations
    reservations.where(reservation_status: "reserved")
  end

  def pending_reservations
    reservations.where(reservation_status: "current")
  end
end
