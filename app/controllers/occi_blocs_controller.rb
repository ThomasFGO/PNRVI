class OcciBlocsController < ApplicationController
  def index
    @blocs = Bloc.all
  end
end
