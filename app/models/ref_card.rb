class RefCard < ApplicationRecord
  belongs_to :energy_type
  belongs_to :list
  has_many :cards, dependent: :destroy

  def right_url
    if fr_url.present?
      [ fr_url, "Version normale française", "fr_url"]
    elsif fr_r_url.present?
      [ fr_r_url, "Version reverse/édition1 française", "fr_r_url" ]
    elsif us_url.present?
      [ us_url, "Version anglaise", "us_url" ]
    else
      [ us_r_url, "Version reverse/édition1 anglaise" ]
    end
  end

  def right_name
    if fr_name.present?
      fr_name
    else
      en_name
    end
  end

  def rarety_icon
    if rarety_type == "Common"
      "common"
    elsif rarety_type == "Uncommon"
      "uncommon"
    rarety_type == "Rare"
      "rare"
    elsif rarety_type == "Rare Holo"
      "holo"
    elsif rarety_type == "Ultra"
      "ultra"
    elsif rarety_type == "Secret"
      "secret"
    end
  end

  def energy_icon
    if super_type == "Pokémon"
      if energy == "Grass"
        "grass"
      elsif energy == "Fire"
        "fire"
      elsif energy == "Lightning"
        "lightning"
      elsif energy == "Fighting"
        "fighting"
      elsif energy == "Metal"
        "metal"
      elsif energy == "Darkness"
        "darkness"
      elsif energy == "Water"
        "water"
      elsif energy == "Fairy"
        "fairy"
      elsif energy == "Psychic"
        "psychic"
      elsif energy == "Colorless"
        "colorless"
      elsif energy == "Dragon"
        "dragon"
      end
    elsif super_type == "Trainer"
      "trainer"
    elsif super_type == "Energy"
      "energy"
    end
  end
end

