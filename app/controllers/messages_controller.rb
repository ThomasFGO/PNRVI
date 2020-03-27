class MessagesController < ApplicationController
  #before_action :find_conversation

  def create
    @message = Message.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to root_path
    end
  end

  private

    def message_params
      params.require(:message).permit(:body, :conversation_id)
    end

    #def find_conversation
      #@conversation = Conversation.find(params[:conversation_id])
    #end

end
