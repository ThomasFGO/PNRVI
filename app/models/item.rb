class Item < ApplicationRecord
  belongs_to :user
  belongs_to :itemable, polymorphic: true, optional:true
  mount_uploader :ph_one, PhotoUploader
  mount_uploader :ph_two, PhotoUploader
  scope :collection_items, -> { where(type: 'Collection_item') }
  scope :search_items, -> { where(type: 'Search_item') }
  scope :shop_items, -> { where(type: 'Shop_item') }
  has_many :selected_items, dependent: :destroy

  def condition_label
    {
      1 => "Mauvais",
      2 => "Moyen",
      3 => "Bon",
      4 => "Très Bon",
      5 => "Neuf"
    }
  end

  def language_flag
    if language == "français"
      "french.png"
    elsif language == "anglais"
      "english.png"
    end
  end

end
