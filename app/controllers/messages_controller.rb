class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    conversation = @message.conversation

    if @message.save && conversation.sender == current_user
      redirect_to conversation_seller_path(conversation.recipient, anchor: "new_message")
    elsif @message.save && conversation.recipient == current_user
      redirect_to conversation_buyer_path(conversation.sender, anchor: "new_message")
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :conversation_id)
  end
end
