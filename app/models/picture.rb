class Picture < ApplicationRecord
  belongs_to :collection_card
  mount_uploader :photo, PhotoUploader
end
