class SelectedItemsController < ApplicationController
  def create
    @selected_item = current_user.selected_items.new(selected_items_params)
    @selected_item.item = Item.find(params[:item_id])
    @selected_item.save
    redirect_to shop_user_path(@selected_item.item.user), notice: "Carte ajoutée au panier"
  end

  def destroy
    @selected_item = SelectedItem.find(params[:id])
    @selected_item.destroy
  end

  private

  def selected_items_params
    params.permit(:shop_item_id, :user_id)
  end
end
