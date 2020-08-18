class Item < ApplicationRecord
  belongs_to :user
  belongs_to :itemable, polymorphic: true, optional:true
  has_many :selected_items, dependent: :destroy
  mount_uploader :ph_one, PhotoUploader
  mount_uploader :ph_two, PhotoUploader
  validates :type, presence: true
  #scope :collection_items, -> { where(type: 'Collection_item') }
  scope :cards, -> { where(itemable_type: 'Card') }
  scope :search, -> { where(type: 'Search_item') }
  scope :shop_items, -> { where(type: 'Shop_item') }
  scope :recent, -> { order(created_at: :desc) }
  scope :lower_to_higher_price, -> { order(value: :asc) }
  scope :higher_to_lower_price, -> { order(value: :desc) }
  scope :best_condition, -> { order(condition: :desc) }
  scope :worst_condition, -> { order(condition: :asc) }

  def condition_name
    if condition == "1"
      "Mauvais"
    elsif condition == "2"
      "Moyen"
    elsif condition == "3"
      "Bon"
    elsif condition == "4"
      "Très Bon"
    elsif condition == "5"
      "Neuf"
    end
  end

  def flag
    if language == "français"
      "fr"
    elsif language == "anglais"
      "uk"
    end
  end

end
