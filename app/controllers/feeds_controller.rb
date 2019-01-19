class FeedsController < ApplicationController
  def index

    #@shop_cards = ShopCard.all
    #@filtered_shop_cards = ShopCard.where(ref_card_id: current_user.search_cards).group(:user).count
    @good_shop_cards = []
    ShopCard.all.each do |shop_card|
      if current_user.search_cards.where(ref_card_id: shop_card.ref_card_id).present?
        @good_shop_cards << shop_card
      end
    end

    @good_shop_cards_per_users = @good_shop_cards.group_by(&:user_id).transform_values(&:count).sort_by{ |k, v| v }.reverse


  end
end


