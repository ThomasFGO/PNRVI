class JapListsController < ApplicationController
  def index
    @jap_blocs = Bloc.jap.order(:rank).includes(:lists)
  end
end
