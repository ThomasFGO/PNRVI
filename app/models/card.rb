class Card < ApplicationRecord
  belongs_to :ref_card
  has_one :item, as: :itemable, dependent: :destroy
  accepts_nested_attributes_for :item
  scope :shop, ->{ joins(:item).merge(Item.shop_items) }
  scope :search, ->{ joins(:item).merge(Item.search) }
  scope :recent, ->{ joins(:item).merge(Item.recent) }
  scope :lower_to_higher_price, ->{ joins(:item).merge(Item.lower_to_higher_price) }
  scope :higher_to_lower_price, ->{ joins(:item).merge(Item.higher_to_lower_price) }
  scope :best_condition, ->{ joins(:item).merge(Item.best_condition) }
  scope :worst_condition, ->{ joins(:item).merge(Item.worst_condition) }
  scope :ranked, ->{ joins(:ref_card).order("ref_cards.rank ASC") }
  scope :filter_by_list, -> (fr_name) { joins(ref_card: :list).where("lists.fr_name ILIKE ?", fr_name)}
  scope :filter_by_name, -> (name) { joins(:ref_card).where("ref_cards.fr_name ILIKE ? OR ref_cards.number ILIKE ?", name, name)}
  scope :filter_by_rarety_type, -> (rarety_type) { joins(:ref_card).where("ref_cards.rarety_type = ?", rarety_type)}
  scope :filter_by_version, -> (version) { where("version = ?", version)}
  include PgSearch::Model
  # pg_search_scope :filter_by_name,
  #   associated_against: { ref_card: [ :fr_name, :number ]},
  #   using: { tsearch: { prefix: true }}
  pg_search_scope :search_by_artist,
    associated_against: { ref_card: [ :artist ]},
    using: { tsearch: { prefix: true }}

  def version_label
    if version == "Holographique"
      ["Holographique", "Holo"]
    elsif version == "Non Holographique"
      ["Non Holographique", "Non Holo"]
    elsif version == "Édition1"
      ["Édition1", "Éd1"]
    elsif version == "Reverse"
      ["Reverse", "Reverse"]
    else
      ["Normale", "Normale"]
    end
  end
end
