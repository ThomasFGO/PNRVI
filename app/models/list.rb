class List < ApplicationRecord
  belongs_to :bloc
  has_many :ref_cards
end
