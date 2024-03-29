class RefCard < ApplicationRecord
  belongs_to :list
  has_many :cards, dependent: :destroy
  validates :super_type, inclusion: { in: %w(Pokémon Trainer Energy)}
  validates :energy, inclusion: { in: %w(Grass Fire Lightning Fighting
    Metal Darkness Water Fairy Psychic Colorless Dragon NoColor)}
  scope :jap, ->{ joins(:list).merge(List.jap) }
  scope :occi, ->{ joins(:list).merge(List.occi) }
  scope :pokemon, ->{ where(super_type: "Pokémon") }
  scope :filter_by_bloc, -> (fr_name) { joins(list: :bloc).where("blocs.fr_name ILIKE ?", "#{fr_name}%")}
  scope :pokedex_order, -> { order(pokedex_number: :asc) }
  scope :ranked, -> { order(rank: :asc) }
  scope :first_generation, -> { pokedex_order.where(pokedex_number: (1..151).to_a) }
  scope :second_generation, -> { pokedex_order.where(pokedex_number: (152..251).to_a) }
  scope :third_generation, -> { pokedex_order.where(pokedex_number: (252..386).to_a) }
  scope :fourth_generation, -> { pokedex_order.where(pokedex_number: (387..493).to_a) }
  scope :fifth_generation, -> { pokedex_order.where(pokedex_number: (494..649).to_a) }
  scope :sixth_generation, -> { pokedex_order.where(pokedex_number: (650..721).to_a) }
  scope :seventh_generation, -> { pokedex_order.where(pokedex_number: (722..809).to_a) }
  scope :eighth_generation, -> { pokedex_order.where(pokedex_number: (810..890).to_a) }
  include PgSearch::Model
  # pg_search_scope :filter_by_list,
  #   associated_against: { list: [ :fr_name ]},
  #   using: { tsearch: { prefix: true }}
  pg_search_scope :filter_by_artist,
    against: :artist,
    using: { tsearch: { prefix: true }}
  pg_search_scope :filter_by_rarety_type,
    against: :rarety_type

  def jap?
    list.jap?
  end

  def name
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
    elsif rarety_type == "Rare"
      "rare"
    elsif rarety_type == "Rare Holo"
      "holo"
    elsif rarety_type == "Ultra"
      "ultra"
    elsif rarety_type == "Secret"
      "secret"
    end
  end

  def rarety_label
    if rarety_type == "Common"
      "Commune"
    elsif rarety_type == "Uncommon"
      "Peu Commune"
    elsif rarety_type == "Rare"
      "Rare"
    elsif rarety_type == "Rare Holo"
      "Holographique"
    elsif rarety_type == "Ultra"
      ultra_type
    elsif rarety_type == "Secret"
      "Secrète"
    end
  end

  def rarety_labels
    {
      "Common" => ["Commune", "common"],
      "Uncmmon" => ["Peu Commune", "uncommon"],
      "Rare" => ["Rare", "rare"],
      "Rare Holo" => ["Holographique", "holo"],
      "Ultra" => [ultra_type, "ultra"],
      "Secret" => ["Secrète", "secret"]
    }
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

  def energyy_labels
    if super_type == "Pokémon"
      {
        "Grass" => ["Plante", "grass"],
        "Fire" => ["Feu", "fire"],
        "Water" => ["Eau", "water"],
        "Lightning" => ["Électrique", "lightning"],
        "Psychic" => ["Psy", "psychic"],
        "Fighting" => ["Combat", "fighting"],
        "Darkness" => ["Psy", "psychic"],
        "Dragon" => ["Combat", "fighting"],
        "Metal" => ["Métal", "metal"],
        "Fairy" => ["Fée", "fairy"],
        "Colorless" => ["Normal", "colorless"]
      }
    end
  end

  def best_url
    if list.rank > 59
      fr_url
    else
      "ref_cards/lists/visuals/#{@list.bloc.cl_name}/#{@code_list}"
    end
  end

  EDITION_1_BLOCS = ["Base", "Gym", "Neo"]

  def version_available_label
    ref_card_bloc = list.bloc.en_name
    if EDITION_1_BLOCS.include? ref_card_bloc
      if rarety_type == "Rare Holo" || rarety_type == "Secret"
        ["Holographique", "Édition 1"]
      else
        ["Non Holographique", "Édition 1"]
      end
    elsif rarety_type == "Ultra" || rarety_type == "Secret"
      ["Normale"]
    elsif ref_card_bloc == "E-Card"
      if rarety_type == "Rare Holo"
        ["Holographique", "Reverse"]
      else
        ["Non Holographique", "Reverse"]
      end
    elsif rarety_type == "Rare Holo"
      ["Holographique", "Non Holographique", "Reverse"]
    else
      ["Non Holographique", "Holographique", "Reverse"]
    end
  end
end

