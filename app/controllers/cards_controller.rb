class CardsController < ApplicationController
  #before_action :set_item, only: [:show, :edit, :update, :destroy]

  def new
    @ref_card = RefCard.find(params[:ref_card_id])
    @card = Card.new
    @item = @card.build_item
  end

  def create
    @card = Card.new(card_params)
    @ref_card = RefCard.find(params[:ref_card_id])
    @card.ref_card = @ref_card
    @card.item.user = current_user
    @card.item.itemable = @card
    #@card.save


    if @card.save
      redirect_to root_path
    else
      byebug
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

  # def set_type
  #   case params[:type]
  #   when 'Collection_item'
  #     'collection_item'
  #   when 'Search_item'
  #     'search_item'
  #   when 'Shop_item'
  #     'shop_item'
  #   end
  # end

  def card_params
    params.require(:card).permit(:version, :grading, :rating, item_attributes: [:type, :condition, :language, :value])
    #item_attributes: [:user_id, :card_id, :type, :condition, :language, :value, :itemable]
  end

  # def item_params
  #   params.require(:item).permit(:type, :condition, :language, :value, :card_id, :user_id, :itemable_type, :itemable_id)
  # end
end
