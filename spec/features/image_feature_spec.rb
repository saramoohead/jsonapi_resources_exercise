require 'rails_helper'

feature 'images' do

  scenario 'exist in the API' do
    get "/images"
    assert last_response.ok?
  end

  scenario 'are created when route receives image url' do
    expect(Image.all.count).to eq 0
    post_request_to_create_image
    result = JSON.parse(last_response.body)["data"]
    expect(result["id"].to_i).to be > 0
    expect(result["type"]).to eq "images"
    expect(result["links"]["self"]).to start_with "http://example.org/images/"
    expect(result["attributes"]).to eq("image-url" => "http://www.example.com/images/image.jpg", "caption" => nil)
    expect(Image.all.count).to eq 1
  end

  scenario 'are not created if not a valid url format' do
    expect(Image.all.count).to eq 0
    post_request_with_incorrect_url
    expect(Image.all.count).to eq 0
  end

  scenario 'can have optional caption added on creation' do
    post_request_with_caption
    result = JSON.parse(last_response.body)["data"]
    expect(result["attributes"]["caption"]).to eq "Boo"
  end

  def post_request_to_create_image
    post "/images", {
      "data" => {
        "type" => "images",
        "attributes" => {
          "image-url" => "http://www.example.com/images/image.jpg"
        }
      }
    }.to_json, "CONTENT_TYPE" => "application/vnd.api+json"
  end

  def post_request_with_incorrect_url
    post "/images", {
      "data" => {
        "type" => "images",
        "attributes" => {
          "image-url" => "images/image.jpg"
        }
      }
    }.to_json, "CONTENT_TYPE" => "application/vnd.api+json"
  end

  def post_request_with_caption
    post "/images", {
      "data" => {
        "type" => "images",
        "attributes" => {
          "image-url" => "http://www.example.com/images/image.jpg",
          "caption" => "Boo"
        }
      }
    }.to_json, "CONTENT_TYPE" => "application/vnd.api+json"
  end

end
