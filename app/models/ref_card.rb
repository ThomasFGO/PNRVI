class RefCard < ApplicationRecord
  belongs_to :energy_type
  belongs_to :list
  has_many :collection_cards, dependent: :destroy
  has_many :search_cards2, dependent: :destroy
  has_many :shop_cards, dependent: :destroy
end
