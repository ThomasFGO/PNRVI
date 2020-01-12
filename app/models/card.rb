class Card < ApplicationRecord
  belongs_to :ref_card
  has_many :items, as: :itemable
end
