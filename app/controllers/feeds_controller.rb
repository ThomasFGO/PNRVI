class FeedsController < ApplicationController
  def index
    @pagy, @shop_cards = pagy(ShopCard.where.not(user_id: current_user).all, size: [1,0,0,1])
    @good_shop_cards = []
    ShopCard.all.each do |shop_card|
      if user_signed_in?
        if current_user.search_cards.where(ref_card_id: shop_card.ref_card_id, reved: shop_card.reved).present?
          @good_shop_cards << shop_card
        end
      end
    end

    @good_shop_cards_count_by_user = @good_shop_cards.group_by(&:user_id).transform_values(&:count).sort_by{ |k, v| v }.reverse.to_h
    @tot_shop_cards_count_by_user = ShopCard.where.not(user_id: current_user).all.group_by(&:user_id).transform_values(&:count).sort_by{ |k, v| v }.reverse.to_h

  end
end


