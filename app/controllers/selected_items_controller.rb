class SelectedItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @selected_items = current_user.selected_items
    @selected_items_grouped = @selected_items.joins(:item).group("items.user_id").count.sort_by{ |k, v| v }.reverse.to_a
  end

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
