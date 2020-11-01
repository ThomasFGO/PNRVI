class Api::V1::BlocsController < Api::V1::BaseController

  def occi
    available_blocs =
      ["Base", "Gym", "Neo", "E-Card", "Ex", "DP", "Platinum", "HGSS", "BW", "XY", "SM", "SS"]
    @occi_blocs = Bloc.occi.where(cl_name: available_blocs).includes(:lists).order(rank: :desc)
  end

  def jap
    @no_symbol_jap_lists = ["base1", "ecardweb", "ecardvs"]
    @jap_blocs = Bloc.jap.includes(:lists).order(rank: :desc)
  end
end
