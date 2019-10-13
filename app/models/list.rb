class List < ApplicationRecord
  belongs_to :bloc
  has_many :ref_cards
  has_many :collection_cards, :through => :ref_cards
  has_many :search_cards, :through => :ref_cards
  has_many :shop_cards, :through => :ref_cards

  def secrets_count
    ref_cards.where(rarety_type: "Secret").count
  end

  def good_url
    if ref_card.fr_url.present?
      fr_url
    elsif ref_card.fr_r_url.present?
      fr_r_url
    else
      us_url
    end
  end
end
