#class MessagesController < ApplicationController
  # before_action :find_conversation

  # def index

  #   if current_user == @conversation.sender
  #     @other_user = @conversation.recipient
  #     @my_selected_cards = current_user.selected_cards.joins(:shop_card).where('shop_cards.user_id' => @other_user.id)
  #     @his_selected_cards = @other_user.selected_cards.joins(:shop_card).where('shop_cards.user_id' => current_user.id)
  #   else
  #     @other_user = @conversation.sender
  #     @my_selected_cards = current_user.selected_cards.joins(:shop_card).where('shop_cards.user_id' => @other_user.id)
  #     @his_selected_cards = @other_user.selected_cards.joins(:shop_card).where('shop_cards.user_id' => current_user.id)
  #   end

  #   @messages = @conversation.messages

  #   if @messages.where.not(user_id: current_user.id)
  #     @messages.mark_as_read! :all, for: current_user
  #   end

  #   if @messages.length > 7
  #     @over_seven = true
  #     @messages = @messages[-7..-1]
  #   end

  #   if params[:m]
  #     @over_seven = false
  #     @messages = @conversation.messages
  #   end

  #   @message = @conversation.messages.new

  # end

  # def create
  #   @message = @conversation.messages.new(message_params)
  # end

  # def new
  #   @message = @conversation.messages.new
  # end

  # private

  #   def message_params
  #     params.require(:message).permit(:body, :user_id)
  #   end

  #   def find_conversation
  #     @conversation = Conversation.find(params[:conversation_id])
  #   end

#end
