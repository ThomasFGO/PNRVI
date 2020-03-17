class BlocsController < ApplicationController
  def index
    @occi_blocs = Bloc.where(jap: false)
  end
end
