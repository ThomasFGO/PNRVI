class Item < ApplicationRecord
  belongs_to :user
  belongs_to :itemable, polymorphic: true, optional:true
  mount_uploader :ph_one, PhotoUploader
  mount_uploader :ph_two, PhotoUploader
  #validates :value, :numericality => { greater_than: 0, message: "doit être supérieur à 0€" }
  validates :ph_one, presence: { message: "de votre carte doit être ajoutée"}
  scope :collection_items, -> { where(type: 'Collection_item') }
  scope :search_items, -> { where(type: 'Search_item') }
  scope :shop_items, -> { where(type: 'Shop_item') }
end
