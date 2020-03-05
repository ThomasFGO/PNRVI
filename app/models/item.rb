class Item < ApplicationRecord
  belongs_to :user
  belongs_to :itemable, polymorphic: true, optional:true
  mount_uploader :ph_one, PhotoUploader
  mount_uploader :ph_two, PhotoUploader
  scope :collection_items, -> { where(type: 'Collection_item') }
  scope :search_items, -> { where(type: 'Search_item') }
  scope :shop_items, -> { where(type: 'Shop_item') }
end
