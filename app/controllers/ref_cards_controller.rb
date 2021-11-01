class RefCardsController < ApplicationController
  def index
    @ref_cards = RefCard.occi.pokemon.pokedex_order

    scopes_params(params).each do |key, value|
      @ref_cards = @ref_cards.public_send(value) if value.present?
    end

    filters_params(params).each do |key, value|
      @ref_cards = @ref_cards.public_send("filter_by_#{key}", value) if value.present?
    end

    if @ref_cards
     @pagy, @ref_cards = pagy(@ref_cards, size: [1,0,0,1])
    end
  end
  def show
    @ref_card = RefCard.find(params[:id])
    @code_list = @ref_card.list.code
    @ref_card_url =
      if @ref_card.jap?
        "ref_cards/jap_lists/visuals/#{@ref_card.list.bloc.cl_name}/#{@code_list}"
      else
        "ref_cards/lists/visuals/#{@ref_card.list.bloc.cl_name}/#{@code_list}"
      end
  end

  private

  def filters_params(params)
    params.slice(:bloc, :artist, :rarety_type)
  end

  def scopes_params(params)
    params.slice(:generation)
  end
end
