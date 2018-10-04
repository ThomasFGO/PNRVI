class RefCard < ApplicationRecord
  belongs_to :energy_type
  belongs_to :list
  has_many :collection_cards
end
