class CollectionCard < ApplicationRecord
  belongs_to :ref_card
  belongs_to :user
  mount_uploader :ph_one, PhotoUploader
  mount_uploader :ph_two, PhotoUploader
  mount_uploader :ph_three, PhotoUploader
  mount_uploader :ph_four, PhotoUploader
  mount_uploader :ph_five, PhotoUploader
end
