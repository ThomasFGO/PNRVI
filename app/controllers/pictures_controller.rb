class PicturesController < ApplicationController

  def index
    @collection_card = CollectionCard.find(params[:collection_card_id])
    @pictures = Picture.all
  end

  def new
    @collection_card = CollectionCard.find(params[:collection_card_id])
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.collection_card = CollectionCard.find(params[:collection_card_id])
    @picture.save
    redirect_to collection_cards_path
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path
  end

  private

  def picture_params
    params.require(:picture).permit(:photo)
  end
end
