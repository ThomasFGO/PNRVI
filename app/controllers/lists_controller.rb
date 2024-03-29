class ListsController < ApplicationController

  AVAILABLE_BLOCS = [4..15]
  def index
    @blocs = Bloc.occi.where(rank: AVAILABLE_BLOCS).includes(:lists).order(rank: :desc)
  end

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
  end
end
