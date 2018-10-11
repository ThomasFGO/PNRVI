class CollectionCardsController < ApplicationController
  def index
    @collection_cards = CollectionCard.all
  end

  def new
    @ref_card = RefCard.find(params[:ref_card_id])
    @collection_card = CollectionCard.new
  end

  def create
    @collection_card = CollectionCard.new(collection_card_params)
    @collection_card.ref_card = RefCard.find(params[:id])
    @collection_card.save
  end

  def delete
  end

  private

  def collection_card_params
    params.require(:collection_card).permit(:reved, :condition, :language)
  end
end
