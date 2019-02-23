class ShopCard < ApplicationRecord
  belongs_to :ref_card
  belongs_to :user
  has_many :selected_cards, dependent: :destroy
  mount_uploader :ph_one, PhotoUploader
  mount_uploader :ph_two, PhotoUploader
  mount_uploader :ph_three, PhotoUploader
  mount_uploader :ph_four, PhotoUploader
  mount_uploader :ph_five, PhotoUploader
  validates :price, presence: { message: "de votre carte doit être indiqué"}
  validates :price, :numericality => { greater_than: 0, message: "doit être supérieur à 0€" }
  validates :ph_one, presence: { message: "de votre carte doit être ajoutée"}
end
