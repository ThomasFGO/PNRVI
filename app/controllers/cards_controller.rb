class CardsController < ApplicationController
  #before_action :authenticate_user!, except: :show

  def index
    shop_cards = Item.where(itemable_type: 'Card', type: 'Shop_item').where.not(user: current_user)
    @shop_cards_count = shop_cards.count
    @pagy, @shop_cards = pagy(shop_cards, size: [1,0,0,1])
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
