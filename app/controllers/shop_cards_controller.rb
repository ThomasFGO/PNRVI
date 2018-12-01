class ShopCardsController < ApplicationController
  def index
    @lists = List.all
    @ref_cards = RefCard.all
    @shop_cards = ShopCard.all
  end

  def show
    @shop_card = ShopCard.find(params[:id])
  end

  def new
    @ref_card = RefCard.find(params[:ref_card_id])
    @shop_card = ShopCard.new
  end

  def create
    @shop_card = ShopCard.new(shop_card_params)
    @shop_card.ref_card = RefCard.find(params[:ref_card_id])
    @shop_card.save
    redirect_to shop_cards_path
  end

  def destroy
    @shop_card = ShopCard.find(params[:id])
    @shop_card.destroy
    redirect_to shop_cards_path
  end

  private

  def shop_card_params
    params.require(:shop_card).permit(:reved, :condition, :language, :price, :ph_one, :ph_two)
  end
end
