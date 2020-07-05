class BlocsController < ApplicationController
  def index
    @occi_blocs = Bloc.occi.includes(:lists).order(rank: :desc)
  end
end
