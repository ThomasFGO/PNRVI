class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def shop
    @user = User.find(params[:id])
    shop_cards = Card.joins(:item).where(items: {type: 'Shop_item', user: @user}).includes(:item)

    @shop_cards = shop_cards

    @lists_available =
      shop_cards.group_by { |shop_card| shop_card.ref_card.list }.to_a.map do |list, shop_cards|
        ["#{list.fr_name} (#{shop_cards.count})", list.fr_name]
      end
      .reverse
      .unshift(["Toutes", nil])

    # @versions_available = shop_cards.group(:version).count.to_a.collect do |version|
    #   ["#{version[0]} (#{version[1]})", version[0]]
    # end
    # @versions_available.unshift(["Toutes", nil])
    @versions = [
      ["Toutes",nil],
      ["Holographique","Holographique"],
      ["Non Holographique","Non Holographique"],
      ["Reverse","Reverse"],
      ["Édition 1","Édition 1"],
      ["Normale","Normale"]
    ]

    @rarety_types = [
      ["Toutes",nil],
      ["Commune","Common"],
      ["Peu commune","Uncommon"],
      ["Rare","Rare"],
      ["Holographique","Rare Holo"],
      ["Ultra-rare","Ultra"],
      ["Secrète", "Secret"]
    ]

    # var = shop_cards.joins(:ref_card).group(:rarety_type).count

    # @rarety_types_available = rarety_types.select{|r| var[r[0]] != nil}.map do |rarety_type|
    #   ["#{rarety_type[1]} (#{var[rarety_type[0]]})", "#{rarety_type[0]}"]
    # end
    # @rarety_types_available.unshift(["Toutes", nil])
    filters_params(params).each do |key, value|
      @shop_cards = @shop_cards.public_send("filter_by_#{key}", value) if value.present?
    end
    scopes_params(params).each do |key, value|
      @shop_cards = @shop_cards.public_send(value) if value.present?
    end



    @shop_cards_count = @shop_cards.count

    #if @shop_cards_count > 0
      @shop_cards_value = @shop_cards.sum(:value)
      @pagy, @shop_cards = pagy(@shop_cards, size: [1,0,0,1])
    #end

  end

  private

  def filters_params(params)
    params.slice(:name, :version, :rarety_type, :list)
  end

  def scopes_params(params)
    params.slice(:sort)
  end
end
