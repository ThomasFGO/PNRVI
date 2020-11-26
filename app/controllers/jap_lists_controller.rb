class JapListsController < ApplicationController

  AVAILABLE_BLOCS =
    ["Base", "Gym", "Neo", "E-Card", "ADV", "PCG"]

  def index
    @no_symbol_jap_lists = ["base1", "ecardweb", "ecardvs"]
    @jap_blocs = Bloc.jap.where(cl_name: AVAILABLE_BLOCS).order(rank: :desc).includes(:lists)
  end
end
