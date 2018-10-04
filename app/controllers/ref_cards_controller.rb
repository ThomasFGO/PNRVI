class RefCardsController < ApplicationController
  def index
    @ref_cards = RefCard.all
  end
  def show
    @ref_card = RefCard.find(params[:id])
  end
end
