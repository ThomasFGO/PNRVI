class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def shop
    @user = User.find(params[:id])
    @shop_cards = Card.joins(:item).where(items: {type: 'Shop_item', user: @user}).includes(:item)
    @shop_cards_count = @shop_cards.count
    @shop_cards_value = @shop_cards.sum(:value)
    @scope = params[:scope]
    if @scope && params[:name].present?
      @shop_cards = @shop_cards.public_send(params[:scope]).search_by_name(params[:name])
    elsif @scope && params[:name]
      @shop_cards = @shop_cards.public_send(params[:scope])
    else
      @shop_cards = @shop_cards.recent
    end
    @pagy, @shop_cards = pagy(@shop_cards, size: [1,0,0,1])

    #@shop_cards_infos = @shop_cards.pluck("cards.id, items.ph_one, items.value")
  end
end
