class Message < ApplicationRecord
  belongs_to :conversation# , optional:true
  belongs_to :user
  validates_presence_of :body, :conversation_id, :user_id
  acts_as_readable on: :created_at

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end
