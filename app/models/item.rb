class Item < ApplicationRecord
  belongs_to :user
  belongs_to :itemable, polymorphic: true
end
