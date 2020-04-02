class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def shop
    @user = User.find(params[:id])
    @shop_cards = Item.shop_items.where(itemable_type: 'Card', user: @user)
    @shop_cards_count = @shop_cards.count
    @shop_cards_value = @shop_cards.sum(:value)
    @scope = params[:scope]
    if @scope
      @shop_cards = @shop_cards.public_send(params[:scope])
    else
      @shop_cards = @shop_cards.recent
    end
    @pagy, @shop_cards = pagy(@shop_cards, size: [1,0,0,1])
  end
end
