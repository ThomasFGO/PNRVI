class CardsController < ApplicationController
  #before_action :set_item, only: [:show, :edit, :update, :destroy]

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

    if @card.save
      redirect_to list_path(@card.ref_card.list, :anchor => "#{@card.ref_card_id}")
    else
      redirect_to new_ref_card_card_path(@card.ref_card, type: @type), alert: @card.errors.full_messages
    end
  end

  # def update
  #   if @item.update(item_params)
  #     redirect_to @user, notice: "#{params[:type]} Item was successfully updated."
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @item.destroy
  #   redirect_to @user, notice: "#{params[:type]} Item was successfully destroyed."
  # end


  private

  # def set_item
  #   @user = User.find(params[:user_id])
  #   @item = @user.send(set_type.pluralize).find(params[:id])
  # end

  def card_params
    params.require(:card).permit(:version, :grading, :rating, item_attributes: [:type, :condition, :language, :value, :ph_one, :ph_two])
  end

end
