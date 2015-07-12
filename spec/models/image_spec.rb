require 'spec_helper'
require 'shoulda/matchers'

describe Image do

  it { should have_one(:caption) }

  it 'is created' do
    image = described_class.create(image_url: 'http://www.example.com/images/image.jpg')
    expect(image.created_at).not_to be nil
  end

end
