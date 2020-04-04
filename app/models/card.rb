class Card < ApplicationRecord
  belongs_to :ref_card
  has_one :item, as: :itemable, dependent: :destroy
  accepts_nested_attributes_for :item
  scope :recent, ->{ joins(:item).merge(Item.recent) }
  scope :lower_to_higher_price, ->{ joins(:item).merge(Item.lower_to_higher_price) }
  scope :higher_to_lower_price, ->{ joins(:item).merge(Item.higher_to_lower_price) }
  scope :best_condition, ->{ joins(:item).merge(Item.best_condition) }
  scope :worst_condition, ->{ joins(:item).merge(Item.worst_condition) }
  include PgSearch::Model
  pg_search_scope :search_by_name,
    associated_against: { ref_card: [ :fr_name ]},
    using: { tsearch: { prefix: true }}
  pg_search_scope :search_by_artist,
    associated_against: { ref_card: [ :artist ]},
    using: { tsearch: { prefix: true }}
end
