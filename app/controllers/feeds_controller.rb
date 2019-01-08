class FeedsController < ApplicationController
  def index
    #@shop_cards = ShopCard.where(ref_card_id: current_user.search_cards).includes(:user)
  end
end
