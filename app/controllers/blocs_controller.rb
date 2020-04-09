class BlocsController < ApplicationController
  def index
    @occi_blocs = Bloc.occi.includes(:lists)
  end
end
