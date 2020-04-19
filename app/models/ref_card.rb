class RefCard < ApplicationRecord
  belongs_to :list
  has_many :cards, dependent: :destroy
  scope :jap, ->{ joins(:list).merge(List.jap) }
  scope :occi, ->{ joins(:list).merge(List.occi) }
  scope :pokemon, ->{ where(super_type: "Pokémon") }
  scope :filter_by_bloc, -> (name) { joins(list: :bloc).where("blocs.fr_name ILIKE ?", "#{name}%")}
  scope :pokedex_order, -> { order(pokedex_number: :asc) }
  scope :first_generation, -> { pokedex_order.where(pokedex_number: (1..151).to_a) }
  scope :second_generation, -> { pokedex_order.where(pokedex_number: (152..251).to_a) }
  scope :third_generation, -> { pokedex_order.where(pokedex_number: (252..386).to_a) }
  scope :fourth_generation, -> { pokedex_order.where(pokedex_number: (387..493).to_a) }
  scope :fifth_generation, -> { pokedex_order.where(pokedex_number: (494..649).to_a) }
  scope :sixth_generation, -> { pokedex_order.where(pokedex_number: (650..721).to_a) }
  scope :seventh_generation, -> { pokedex_order.where(pokedex_number: (722..809).to_a) }
  scope :eighth_generation, -> { pokedex_order.where(pokedex_number: (809..890).to_a) }
  include PgSearch::Model
  pg_search_scope :search_by_list,
    associated_against: { list: [ :fr_name ]},
    using: { tsearch: { prefix: true }}
  pg_search_scope :filter_by_artist,
    against: :artist,
    using: { tsearch: { prefix: true }}
  pg_search_scope :filter_by_rarety_type,
    against: :rarety_type


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

