class ListsController < ApplicationController
  def show
    @list = List.find(params[:id])
    @ref_cards = @list.ref_cards
  end
end
