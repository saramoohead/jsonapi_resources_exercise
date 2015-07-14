class Caption < ActiveRecord::Base

  belongs_to :image

  validates :caption_text, presence: true
  validates :image_id, presence: true

end
