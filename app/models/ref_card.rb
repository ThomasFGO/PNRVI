class RefCard < ApplicationRecord
  belongs_to :energy_type
  belongs_to :list
  has_many :cards, dependent: :destroy

  def right_url
    if fr_url.present?
      [ fr_url, "Version normale française", "fr_url"]
    elsif fr_r_url.present?
      [ fr_r_url, "Version reverse/édition1 française", "fr_r_url" ]
    elsif us_url.present?
      [ us_url, "Version anglaise", "us_url" ]
    else
      [ us_r_url, "Version reverse/édition1 anglaise" ]
    end
  end

  def right_name
    if fr_name.present?
      fr_name
    else
      en_name
    end
  end

end
