class PicturesController < ApplicationController

  def new
    @collection_card = CollectionCard.find(params[:collection_card_id])
    @picture = Picture.new
  end

  private

  def picture_params
  params.require(:picture).permit(:photo)
end
end
