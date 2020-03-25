class SellersController < ApplicationController
  before_action :authenticate_user!
  def show
    selected_items = current_user.selected_items.joins(item: :user)

    @selected_items_sum =
      selected_items
        .pluck("items.count, sum(items.value) as value_sum")

    @selected_items_grouped =
      selected_items
        .group("items.user_id", :first_name, :last_name)
        .pluck("items.user_id, users.first_name, users.last_name, items.count, sum(items.value) as value_sum")

    @seller = User.find(params[:id])

    @selected_items_seller =
      @selected_items_grouped.find { |s| s[0] == @seller.id }

    @conversation =
      Conversation.find_by(sender_id: current_user.id, recipient_id: @seller.id)
    # or Conversation.new and Message.new --> Nested attributes (card and item)

  end
end
