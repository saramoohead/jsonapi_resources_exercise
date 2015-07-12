require 'rails_helper'

feature 'images' do

  scenario 'exist in the API' do
    get "/images"
    assert last_response.ok?
  end

  scenario 'are created when route receives image url' do
    expect(Image.all.count).to eq 0
    post "/images", image_url: 'http://www.example.com/images/image.jpg'
    expect(Image.all.count).to eq 1
  end

end
