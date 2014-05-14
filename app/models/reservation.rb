class Reservation < ActiveRecord::Base
  FIELD_MAP = {
    "first_name" => "users.first_name",
    "name" => "items.name",
    "category" => "items.category"
  }

  belongs_to :user
  belongs_to :item

  validates :begins_at, presence: true
  validates :ends_at, presence: true

  validates_with DateChecker

  TYPES = ['approved', 'pending', 'closed']

  def self.paginated(page, per)
    page(page).per(per)
  end

  def self.almost_due(warning_time)
    where("ends_at > ?", warning_time).
      where.not(reservation_status: 'closed').
      distinct
  end

  def self.upcoming
    order(begins_at: :desc)
  end

  def self.recent
    order(created_at: :desc)
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

  def self.sort(sort_field)
    if sort_field.nil?
      scoped
    else
      field = connection.quote_string(FIELD_MAP[sort_field] || sort_field)
      includes(:user, :item).order("#{field} ASC")
    end
  end
end
