class Card < ApplicationRecord
  belongs_to :ref_card
  has_one :item, as: :itemable
  #has_one :collection_item, class_name: 'Collection_item', as: :itemable
  #has_one :search_item, class_name: 'Search_item', as: :itemable
  #has_one :shop_item, class_name: 'Shop_item', as: :itemable
  accepts_nested_attributes_for :item
  #ajouter validation sur rating if grading true

end
