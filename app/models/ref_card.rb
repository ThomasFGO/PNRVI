class RefCard < ApplicationRecord
  belongs_to :energy_type
  belongs_to :list
  has_many :collection_cards
  has_many :search_cards
  has_many :shop_cards
end
