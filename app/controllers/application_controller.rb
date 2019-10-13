class ApplicationController < ActionController::Base
  include Pagy::Backend
  #before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :unread

  def unread
    if user_signed_in?
      @good_conversations = Conversation.where(sender_id: current_user.id).or(Conversation.where(recipient_id: current_user.id))
      good_messages = Message.where.not(user_id: current_user).joins(:conversation).where(conversation_id: @good_conversations)
      @unread_count = good_messages.unread_by(current_user).count
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
      keys: [:first_name, :last_name, :city, :postal_code, :avatar, :email, :password, :remember_me])
  end
end
