class RefCard < ApplicationRecord
  belongs_to :energy_type
  belongs_to :list
  has_many :cards, dependent: :destroy

  def good_url
    if fr_url.present?
      fr_url
    elsif fr_r_url.present?
      fr_r_url
    else
      us_url
    end
  end

end
