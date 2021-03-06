class Item < ActiveRecord::Base
  has_many :reservations, dependent: :destroy
  has_many :pairs, dependent: :destroy
  has_many :pair_items, through: :pairs

  validates :name, presence: true
  validates :url, presence: true
  validates :category, presence: true
  validates :description, presence: true

  CATEGORIES = ['camera', 'tripod', 'audio', 'other']

  def self.paginated(page, per)
    page(page).per(per)
  end

  def reservation
    reservations.where(reservation_status: "current").first
  end

  def pair_with(item)
    unless item == self
      transaction do
        self.pair_items << item
        item.pair_items << self
      end
    end
  end

  def unpair_with(item)
    transaction do
      self.pair_items.delete(item)
      item.pair_items.delete(self)
    end
  end

  def reserved?
    reservation.present?
  end

  def reserved_by?(user)
    reserved? && reservation.user == user
  end
end
