class Bloc < ApplicationRecord
  has_many :lists
  scope :jap, -> { where(jap: true) }
  scope :occi, -> { where.not(jap: true) }
end
