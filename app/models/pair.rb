class Pair < ActiveRecord::Base
  belongs_to :item
  belongs_to :pair_item, class_name: "Item"
  validates :item_id, presence: true
  validates :pair_item_id, presence: true
  validates_uniqueness_of :item_id, scope: [:pair_item_id]
end
