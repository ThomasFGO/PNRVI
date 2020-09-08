class BlocsController < ApplicationController

  AVAILABLE_BLOCS =
    ["Base", "Gym", "Neo", "E-Card", "Ex", "DP", "Platinum", "HGSS", "BW", "XY", "SM", "SS"]
  def index
    @occi_blocs = Bloc.occi.where(cl_name: AVAILABLE_BLOCS).includes(:lists).order(rank: :desc)
  end
end
