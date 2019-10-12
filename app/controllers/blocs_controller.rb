class BlocsController < ApplicationController
  def index
    @blocs = Bloc.all
  end
end
