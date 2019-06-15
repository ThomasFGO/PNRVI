class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @good_shop_cards = []
    @user.shop_cards.all.each do |shop_card|
      if current_user.search_cards.where(ref_card_id: shop_card.ref_card_id, reved: shop_card.reved).present?
        @good_shop_cards << shop_card
      end
    end
    @good_shop_cards_count_by_user = @good_shop_cards.group_by(&:user_id).transform_values(&:count).sort_by{ |k, v| v }.reverse.to_h
    @pagy, @user_shop_cards = pagy(@user.shop_cards, size: [1,0,0,1])
  end
end
