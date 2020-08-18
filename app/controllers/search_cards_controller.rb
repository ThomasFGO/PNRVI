class SearchCardsController < ApplicationController
  def index
    @search_cards =
      Card.search
        .includes(:item)
        .where(items: {user: current_user})
        .includes(ref_card: :list)

    @search_cards_sum = @search_cards.count

    @search_cards_by_list =
      @search_cards
        .order("lists.rank DESC, ref_cards.rank ASC")
        .group_by { |search_card| search_card.ref_card.list }

  end
end
