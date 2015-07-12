class ImageResource < JSONAPI::Resource

  attributes :image_url

  has_many :captions

end
