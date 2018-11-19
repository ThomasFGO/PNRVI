class CollectionCard < ApplicationRecord
  belongs_to :ref_card
  has_many :pictures
end
