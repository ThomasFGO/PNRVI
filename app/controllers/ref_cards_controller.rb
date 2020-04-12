class RefCardsController < ApplicationController
  def index
    if params[:bloc].present?
      sql_query = " \
        blocs.fr_name ILIKE :query \
      "
    end
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
  end

  private

  def filters_params(params)
    params.slice(:bloc, :artist)
  end

  def scopes_params(params)
    params.slice(:generation)
  end
end
