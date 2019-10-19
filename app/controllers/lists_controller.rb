class ListsController < ApplicationController
  def index
    @occi_blocs = Bloc.where(jap: false)
  end
  def show
    @list = List.find(params[:id])
    @ref_cards = @list.ref_cards
  end
end
