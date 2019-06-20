class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @good_shop_cards = []
    @user.shop_cards.all.each do |shop_card|
      if user_signed_in?
        if current_user.search_cards.where(ref_card_id: shop_card.ref_card_id, reved: shop_card.reved).present?
          @good_shop_cards << shop_card
        end
      end
    end
    @good_shop_cards_count_by_user = @good_shop_cards.group_by(&:user_id).transform_values(&:count).sort_by{ |k, v| v }.reverse.to_h
    @pagy, @user_shop_cards = pagy(@user.shop_cards, page_param: :page_all, params: { active_tab: 'all' }, size: [1,0,0,1])
    @pagy_a, @good_shop_cards = pagy_array(@good_shop_cards, page_param: :page_match, params: { active_tab: 'match' }, size: [1,0,0,1])
  end
end
