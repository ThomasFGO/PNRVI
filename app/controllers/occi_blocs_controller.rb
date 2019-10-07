class OcciBlocsController < ApplicationController
  def index
    @occi_blocs = OcciBloc.all
  end
end
