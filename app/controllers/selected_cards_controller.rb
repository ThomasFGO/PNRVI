class SelectedCardsController < ApplicationController
  before_action :authenticate_user!
  def index
    @selected_cards = current_user.selected_cards
    #@selected_cards_count_by_users = @selected_cards.group_by(&:user_id).transform_values(&:count).sort_by{ |k, v| v }.reverse
    @selected_cards_grouped = @selected_cards.joins(:shop_card).group("shop_cards.user_id").count.sort_by{ |k, v| v }.reverse.to_a
    @last_selected_cards = @selected_cards.sort_by(&:created_at).reverse
  end

  def create
    @selected_card = current_user.selected_cards.new(selected_card_params)
    @selected_card.shop_card = ShopCard.find(params[:shop_card_id])
    @selected_card.save
    redirect_to selected_cards_path
  end

  def destroy
    @selected_card = SelectedCard.find(params[:id])
    @selected_card.destroy
    redirect_to selected_cards_path
  end

  private

  def selected_card_params
    params.permit(:shop_card_id, :user_id)
  end
end
