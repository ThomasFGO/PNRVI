class Item < ApplicationRecord
  belongs_to :user
  belongs_to :itemable, polymorphic: true, optional:true
  has_many :selected_items, dependent: :destroy
  mount_uploader :ph_one, PhotoUploader
  mount_uploader :ph_two, PhotoUploader
  validates :type, presence: true
  #scope :collection_items, -> { where(type: 'Collection_item') }
  #scope :search_items, -> { where(type: 'Search_item') }
  scope :shop_items, -> { where(type: 'Shop_item') }
  scope :recent, -> { order(created_at: :desc) }
  scope :lower_to_higher_price, -> { order(value: :asc) }
  scope :higher_to_lower_price, -> { order(value: :desc) }
  scope :best_condition, -> { order(condition: :desc) }
  scope :worst_condition, -> { order(condition: :asc) }

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
