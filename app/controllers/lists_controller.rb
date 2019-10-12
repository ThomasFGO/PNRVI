class ListsController < ApplicationController
  def index
    @blocs = Bloc.all
  end
  def show
    @list = List.find(params[:id])
    @ref_cards = @list.ref_cards
  end
end
