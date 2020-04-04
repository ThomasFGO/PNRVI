class BlocsController < ApplicationController
  def index
    @occi_blocs = Bloc.where(jap: false).includes(:lists).order("lists.id ASC")
  end
end
