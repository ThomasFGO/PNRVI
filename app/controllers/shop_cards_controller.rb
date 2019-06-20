class ShopCardsController < ApplicationController
  before_action :authenticate_user!, except: :show

  def index
    @lists = List.all
    @ref_cards = RefCard.all
    @pagy, @shop_cards = pagy(current_user.shop_cards.all, size: [1,0,0,1])
  end

  def show
    @shop_card = ShopCard.find(params[:id])
  end

  def new
    @ref_card = RefCard.find(params[:ref_card_id])
    @reved_saved = current_user.shop_cards.where(ref_card_id: @ref_card.id, reved: true).count
    @normal_saved = current_user.shop_cards.where(ref_card_id: @ref_card.id, reved: false).count
    @shop_card = ShopCard.new
  end

  def create
    @shop_card = current_user.shop_cards.new(shop_card_params)
    @shop_card.ref_card = RefCard.find(params[:ref_card_id])
    if @shop_card.save
      redirect_to list_path(@shop_card.ref_card.list, :anchor => "#{@shop_card.ref_card_id}")
    else
      redirect_to new_ref_card_shop_card_path(@shop_card.ref_card), alert: @shop_card.errors.full_messages
    end
  end

  def edit
    @shop_card = ShopCard.find(params[:id])
  end

  def update
    @shop_card = ShopCard.find(params[:id])
    @shop_card.update(shop_card_params)
    redirect_to shop_card_path(@shop_card)
  end

  def destroy
    @shop_card = ShopCard.find(params[:id])
    @shop_card.destroy
    redirect_to shop_cards_path
  end

  private

  def shop_card_params
    params.require(:shop_card).permit(:user_id, :reved, :condition, :language, :price, :ph_one, :ph_two)
  end
end
