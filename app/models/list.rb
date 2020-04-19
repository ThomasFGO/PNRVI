class List < ApplicationRecord
  belongs_to :bloc
  has_many :ref_cards
  has_many :collection_cards, :through => :ref_cards
  has_many :search_cards, :through => :ref_cards
  has_many :shop_cards, :through => :ref_cards
  scope :jap, ->{ joins(:bloc).merge(Bloc.jap) }
  scope :occi, ->{ joins(:bloc).merge(Bloc.occi) }

  def secrets_count
    ref_cards.where(rarety_type: "Secret").count
  end

  def jap?
    bloc.jap == true
  end

  def occi?
    bloc.jap == false
  end

  def name
    if fr_name.present?
      fr_name
    else
      en_name
    end
  end

  def french?
    fr_name.present?
  end

  def flag
    if fr_name.present?
      "fr_flag"
    elsif bloc.jap == true
      "jap_flag"
    else
      "uk_flag"
    end
  end
end
