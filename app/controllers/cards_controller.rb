class CardsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    search_cards = Card.joins(:item, :ref_card).search.where(items: {user: current_user})
    @search_cards_infos = search_cards.pluck("ref_cards.id, items.value, version, language, condition")
    @match_cards =
      Card.shop
        .joins(:item)
        .where.not("items.user": current_user)
        .joins(:ref_card)
        .select do |shop_card|
          @search_cards_infos.find do |infos|
            infos[0] == shop_card.ref_card_id &&
            infos[1] >= shop_card.item.value &&
            infos[2] == shop_card.version &&
            infos[3] == shop_card.item.language &&
            infos[4].to_i <= shop_card.item.condition.to_i
        end
      end
    @match_cards_ids = @match_cards.pluck(:id)

    shop_cards =
      if params[:match].present?
        Card.where(id: @match_cards_ids)
      else
        Card.joins(:item).shop.where.not(items: {user: current_user})
      end

    @shop_cards =
      if params[:scope].present? && params[:name].present?
        shop_cards.joins(:ref_card).public_send(params[:scope]).search_by_name(params[:name])
      elsif params[:scope].present?
        shop_cards.joins(:ref_card).public_send(params[:scope])
      else
        shop_cards
      end

    @shop_cards_count = @shop_cards.count
    @pagy, @shop_cards = pagy(@shop_cards, size: [1,0,0,1])
  end

  def show
    @card = Card.find(params[:id])
    @item = @card.item
  end

  def new
    @ref_card = RefCard.find(params[:ref_card_id])
    @card = Card.new
    @item = @card.build_item
    @type = params[:type]

    #TODO replacer dans le model Item
    @label_value =
      if @type == "Shop_item"
        ["Prix", "au magasin"]
      elsif @type == "Search_item"
        ["Prix maximum", "aux recherches"]
      else
        ["Valeur", "à la collection"]
      end
  end

  def create
    @card = Card.new(card_params)
    @ref_card = RefCard.find(params[:ref_card_id])
    @card.ref_card = @ref_card
    @card.item.user = current_user
    @card.item.itemable = @card
    @type = @card.item.type

    if @card.save
      redirect_to list_path(@card.ref_card.list, :anchor => "#{@card.ref_card_id}")
    else
      redirect_to new_ref_card_card_path(@card.ref_card, type: @type),alert: @card.errors.full_messages
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to shop_user_path(current_user), notice: "Votre carte est bien été retirée du magasin"
  end


  private

  def card_params
    params.require(:card).permit(:version, :grading, :rating, item_attributes: [:type, :condition, :language, :value, :ph_one, :ph_two])
  end

end
