class SearchCard < ApplicationRecord
  belongs_to :ref_card
  belongs_to :user
end
