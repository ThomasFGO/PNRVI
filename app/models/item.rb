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
      "Mauvais état"
    elsif condition == "2"
      "État moyen"
    elsif condition == "3"
      "Bon état"
    elsif condition == "4"
      "Très bon état"
    elsif condition == "5"
      "État neuf"
    end
  end

  def flag
    if language == "français"
      "fr"
    elsif language == "anglais"
      "uk"
    end
  end

  def online_date
    fr_days = ["Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi"]
    year = created_at.strftime("%Y").to_i
    month = created_at.strftime("%m").to_i
    day = created_at.strftime("%d").to_i
    age_in_days = (Date.today - Date.new(year, month, day)).to_i
    if age_in_days > 7
      "Il y a #{age_in_days} jours (#{created_at.strftime("%d/%m/%Y")})"
    elsif age_in_days > 1
      "#{fr_days[created_at.strftime("%w").to_i]} dernier à #{created_at.strftime("%k:%M")}"
    elsif age_in_days == 1
      "Hier à #{created_at.strftime("%k:%M")}"
    else
      "Mise en ligne aujourd'hui à #{created_at.strftime("%k:%M")}"
    end
  end

end
