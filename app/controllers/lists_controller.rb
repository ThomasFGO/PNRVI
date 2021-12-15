class ListsController < ApplicationController

  AVAILABLE_OCCI_BLOCS =
    ["Base", "Gym", "Neo", "E-Card", "Ex", "DP", "Platinum", "HGSS", "BW", "XY", "SM", "SS"]

  AVAILABLE_JAP_BLOCS =
    ["Original", "Neo", "E-Card", "ADV"]
    #["Original", "Neo", "E-Card", "ADV", "PCG", "DP", "Platinum", "HGSS", "BW", "XY", "SM", "SS"]

  def occi_index
    @occi_blocs = Bloc.occi.where(cl_name: AVAILABLE_OCCI_BLOCS).includes(:lists).order(rank: :desc)
  end

  def jap_index
    @no_symbol_jap_lists = ["base1"]
    @jap_blocs = Bloc.jap.where(cl_name: AVAILABLE_JAP_BLOCS).includes(:lists).order(rank: :desc)
  end

  def show
    @no_symbol_jap_lists = ["base1"]
    @list = List.find(params[:id])
    @ref_cards = @list.ref_cards
    @code_list = @list.code
    @ref_card_url =
      if @list.jap?
        "ref_cards/jap_lists/visuals/#{@list.bloc.cl_name}/#{@code_list}"
      else
        "ref_cards/lists/visuals/#{@list.bloc.cl_name}/#{@code_list}"
      end
  end
end
