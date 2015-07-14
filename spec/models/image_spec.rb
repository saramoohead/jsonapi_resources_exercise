require 'spec_helper'
require 'shoulda/matchers'

describe Image do

  it 'is created with image url' do
    image = described_class.create(image_url: 'http://www.example.com/images/image.jpg')
    expect(image.created_at).not_to eq nil
  end

  it 'can have an optional caption' do
    image = described_class.create(image_url: 'http://www.example.com/images/image.jpg', caption: 'Boo')
    expect(image.caption).to eq "Boo"
  end

end
