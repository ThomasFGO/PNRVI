class SearchCardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lists = List.all
    @ref_cards = RefCard.all
    @search_cards = SearchCard.all
  end

  def show
    @search_card = SearchCard.find(params[:id])
  end

  def new
    @ref_card = RefCard.find(params[:ref_card_id])
    @search_card = SearchCard.new
  end

  def create
    @search_card = SearchCard.new(search_card_params)
    @search_card.ref_card = RefCard.find(params[:ref_card_id])
    @search_card.save
    redirect_to search_cards_path
  end

  def destroy
    @search_card = SearchCard.find(params[:id])
    @search_card.destroy
    redirect_to search_cards_path
  end

  private

  def search_card_params
    params.require(:search_card).permit(:reved, :condition, :language)
  end
end
