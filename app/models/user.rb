class User < ApplicationRecord
  mount_uploader :avatar, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_reader
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :items
  has_many :selected_items
  has_many :conversations
  has_many :messages
  scope :all_except, ->(user) { where.not(id: user) }

  def default_buyer(current_user)
    User.find(buyers(current_user).first)
  end

  def has_buyers(current_user)
    buyers(current_user).count > 0
  end

  def buyers(current_user)
    Conversation.joins(:messages).where(recipient_id: current_user.id).uniq.pluck(:sender_id)
  end

  def has_sellers
    selected_items.count > 0
  end

  def default_seller
    selected_items.last.item.user
  end

  def member_since
    created_at.strftime("%d/%m/%Y")
  end

  def shop_size
    items.where(type: 'Shop_item').count
  end

  def boolean_response(attribute)
    if attribute
      "oui"
    else
      "non"
    end
  end

end
