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
end
