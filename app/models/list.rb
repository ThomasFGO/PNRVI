class List < ApplicationRecord
  belongs_to :bloc
  has_many :ref_cards
  has_many :collection_cards, :through => :ref_cards
  has_many :search_cards, :through => :ref_cards
  has_many :shop_cards, :through => :ref_cards
end
