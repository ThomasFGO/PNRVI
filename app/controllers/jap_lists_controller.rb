class JapListsController < ApplicationController

  def index
    @no_symbol_jap_lists = ["base1", "ecardweb", "ecardvs"]
    @jap_blocs = Bloc.jap.order(rank: :desc).includes(:lists)
  end
end
