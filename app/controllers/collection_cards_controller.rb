class CollectionCardsController < ApplicationController
  def index
    @lists = List.all
    @ref_cards = RefCard.all
    @collection_cards = CollectionCard.all
  end

  def new
    @ref_card = RefCard.find(params[:ref_card_id])
    @collection_card = CollectionCard.new
  end

  def create
    @collection_card = CollectionCard.new(collection_card_params)
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
    params.require(:collection_card).permit(:reved, :condition, :language)
  end
end
