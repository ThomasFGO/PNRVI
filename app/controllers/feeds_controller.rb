class FeedsController < ApplicationController
  def index
    @good_shop_cards = []
    ShopCard.all.each do |shop_card|
      if current_user.search_cards.where(ref_card_id: shop_card.ref_card_id, reved: shop_card.reved).present?
        @good_shop_cards << shop_card
      end
    end

    @good_shop_cards_count_by_users = @good_shop_cards.group_by(&:user_id).transform_values(&:count).sort_by{ |k, v| v }.reverse
    @pagy_a, @last_good_shop_cards = pagy_array(@good_shop_cards.sort_by(&:created_at).reverse, size: [1,0,0,1])
  end
end


