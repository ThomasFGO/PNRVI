class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def shop
    @user = User.find(params[:id])
    shop_cards = Item.where(itemable_type: 'Card', type: 'Shop_item', user: @user)
    @shop_cards_count = shop_cards.count
    @shop_cards_value = shop_cards.sum(:value)
    @pagy, @shop_cards = pagy(shop_cards, size: [1,0,0,1])
  end
end
