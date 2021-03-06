class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @good_conversations = Conversation.where(sender_id: current_user.id).or(Conversation.where(recipient_id: current_user.id))
  end

  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    if @conversation.save && @conversation.sender == current_user
      redirect_to conversation_seller_path(@conversation.recipient)
    end
  end

  private
    def conversation_params
      params.permit(:sender_id, :recipient_id)
    end

end
