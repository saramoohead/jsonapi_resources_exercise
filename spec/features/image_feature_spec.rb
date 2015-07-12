require 'rails_helper'

feature 'images' do

  scenario 'exist in the API' do
    get "/images"
    assert last_response.ok?
  end

  scenario 'are created when route receives image url' do
    expect(Image.all.count).to eq 0
    # request.env['HTTP_ACCEPT'] = 'application/vnd.api+json'
    # request.env['CONTENT_TYPE'] = 'application/vnd.api+json'
    # request.accept = "application/vnd.api+json"
    # post :create, { "data": { "type": "images", "attributes": {"image_url": "http://www.example.com/images/image.jpg" } } }
    # post "/images", { "data" => { "type" => "images", "image_url" => "http://www.example.com/images/image.jpg" } }
    # post "/images", {format: :"json+api", "data" => { "type" => "images", "image_url" => "http://www.example.com/images/image.jpg" } }, {"CONTENT_TYPE" => "application/vnd.api+json"}
    # expect(JSON.parse(last_response.body)).to eq({ not_sure: "what" })
    expect(Image.all.count).to eq 1
  end

end
