class Item < ApplicationRecord
  belongs_to :user
  belongs_to :itemable, polymorphic: true, optional:true
  scope :collection_items, -> { where(type: 'Collection_item') }
  scope :search_items, -> { where(type: 'Search_item') }
  scope :shop_items, -> { where(type: 'Shop_item') }
end
