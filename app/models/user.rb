class User < ApplicationRecord
  mount_uploader :avatar, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_reader
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_many :selected_items
end
