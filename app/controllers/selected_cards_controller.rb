class SelectedCardsController < ApplicationController
  def index
    @selected_cards = current_user.selected_cards.all
  end

  def create
    @selected_card = current_user.selected_cards.new(selected_card_params)
    @selected_card.shop_card = ShopCard.find(params[:shop_card_id])
    @selected_card.save
    redirect_to user_path(@selected_card.shop_card.user)
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
