class ListsController < ApplicationController
  def index
    @blocs = Bloc.all
  end
  def show
    @list = List.find(params[:id])
  end
end
