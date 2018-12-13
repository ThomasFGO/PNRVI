class CollectionCardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = List.all
    @ref_cards = RefCard.all
    @collection_cards = current_user.collection_cards.all
  end

  def show
    @collection_card = CollectionCard.find(params[:id])
  end

  def new
    @ref_card = RefCard.find(params[:ref_card_id])
    @collection_card = CollectionCard.new
  end

  def create
    @collection_card = current_user.collection_cards.new(collection_card_params)
    @collection_card.ref_card = RefCard.find(params[:ref_card_id])
    @collection_card.save
    redirect_to collection_cards_path
  end

  def destroy
    @collection_card = CollectionCard.find(params[:id])
    @collection_card.destroy
    redirect_to collection_cards_path
  end

  private

  def collection_card_params
    params.require(:collection_card).permit(:user_id, :reved, :condition, :language, :ph_one)
  end
end
