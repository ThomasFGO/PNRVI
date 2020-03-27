class SellersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sellers, only: [:panier, :conversation]

  def panier
    @selected_items_by_seller =
      @selected_items.where('items.user_id' => @seller.id)
  end

  def conversation
    if @conversation
      @messages = @conversation.messages
      @message = @conversation.messages.new
    end
  end

  private

  def set_sellers
    @selected_items = current_user.selected_items.joins(item: :user)

    @selected_items_sum =
      @selected_items
        .pluck("items.count, sum(items.value) as value_sum")

    @selected_items_grouped =
      @selected_items
        .group("items.user_id", :first_name, :last_name)
        .pluck("items.user_id, users.first_name, users.last_name, items.count, sum(items.value) as value_sum")

    @seller = User.find(params[:id])

    @selected_items_sum_seller =
      @selected_items_grouped.find { |s| s[0] == @seller.id }

    @conversation = Conversation.where(sender_id: current_user.id, recipient_id: @seller.id).first
  end
end
