class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @good_shop_cards = []
    @user.shop_cards.all.each do |shop_card|
      if current_user.search_cards.where(ref_card_id: shop_card.ref_card_id, reved: shop_card.reved).present?
        @good_shop_cards << shop_card
      end
    end
  end
end
