class SelectedCard < ApplicationRecord
  belongs_to :shop_card
  belongs_to :user
end
