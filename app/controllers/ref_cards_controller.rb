class RefCardsController < ApplicationController
  def show
    @ref_card = RefCard.find(params[:id])
  end
end
