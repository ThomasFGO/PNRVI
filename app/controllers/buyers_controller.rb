class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_buyers, only: [:demande, :conversation]

  def demande
    @order_items_by_buyer =
      @order_items.where(user_id: @buyer.id)
  end

  def conversation
    @conversation = Conversation.joins(:messages).where(recipient_id: current_user.id, sender_id: @buyer.id).first
    @messages = @conversation.messages
    @message = @conversation.messages.new
  end

  private

  def set_buyers
    available_buyers_ids =
      Conversation.joins(:messages).where(recipient_id: current_user.id).pluck(:sender_id)

    @order_items =
      SelectedItem
        .where(user_id: available_buyers_ids)
        .joins(:item, :user)
        .where("items.user_id": current_user.id)

    @order_items_grouped =
      @order_items
        .group(:user_id, :first_name, :last_name)
        .pluck("selected_items.user_id, first_name, last_name, selected_items.count, sum(items.value) as value_sum")

    @buyer = User.find(params[:id])

    @order_items_sum_buyer =
      @order_items_grouped.find { |s| s[0] == @buyer.id }
  end
end
