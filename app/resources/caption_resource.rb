class CaptionResource < JSONAPI::Resource

  attributes :caption_text
  has_one :image

  filter :contact

end
