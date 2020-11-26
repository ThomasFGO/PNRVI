class ListsController < ApplicationController

  AVAILABLE_BLOCS =
    ["Base", "Gym", "Neo", "E-Card", "Ex", "DP", "Platinum", "HGSS", "BW", "XY", "SM", "SS"]

  def index
    @occi_blocs = Bloc.occi.where(cl_name: AVAILABLE_BLOCS).includes(:lists).order(rank: :desc)
  end

  def show
    @no_symbol_jap_lists = ["base1", "ecardweb", "ecardvs"]
    @list = List.find(params[:id])
    @ref_cards = @list.ref_cards
    @code_list = @list.code
    @ref_card_url =
      if @list.jap?
        "jap_lists/visuals/#{@list.bloc.cl_name}/#{@code_list}"
      else
        "lists/visuals/#{@list.bloc.cl_name}/#{@code_list}"
      end
  end
end
