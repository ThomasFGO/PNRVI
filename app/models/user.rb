class User < ApplicationRecord
  mount_uploader :avatar, PhotoUploader
  has_many :shop_cards, dependent: :destroy
  has_many :selected_cards, dependent: :destroy
  has_many :search_cards, dependent: :destroy
  has_many :collection_cards, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_reader
  validates :first_name, presence: true
  validates :last_name, presence: true
end
