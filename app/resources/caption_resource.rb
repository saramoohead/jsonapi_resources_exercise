class CaptionResource < JSONAPI::Resource

  attributes :caption_text, :image_id
  has_one :image

end
