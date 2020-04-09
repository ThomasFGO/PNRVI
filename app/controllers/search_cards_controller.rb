class SearchCardsController < ApplicationController
  def index
    @search_cards = Card.joins(:item).search.where(items: {user: current_user})
  end
end
