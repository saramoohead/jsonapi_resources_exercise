require 'rails_helper'

feature 'captions' do

  # before :each do
  #   post "/images", { "data" => { "type" => "images", "attributes" => { "image-url" => "http://www.example.com/images/image.jpg" } } }.to_json, { "CONTENT_TYPE" => "application/vnd.api+json" }
  # end

  scenario 'exist in the API' do
    get "/captions"
    assert last_response.ok?
  end

  scenario 'are created when route receives caption and image id' do
    expect(Caption.all.count).to eq 0
    post "/images", { "data" => { "type" => "images", "attributes" => { "image-url" => "http://www.example.com/images/image.jpg" } } }.to_json, { "CONTENT_TYPE" => "application/vnd.api+json" }

    post "/captions", { "data" => { "type" => "captions", "attributes" => { "caption-text" => "Hey Bob", "image-id" => "1" } } }.to_json, { "CONTENT_TYPE" => "application/vnd.api+json" }


    # post "/captions", { "data" => { 
    #                       "type" => "captions", 
    #                       "attributes" => { 
    #                         "caption-text" => "A wonderful book"
    #                       },
    #                       "relationships" => { 
    #                         "image" => { 
    #                           "data" => { "type" => "images", "id" => "1" } 
    #                         } 
    #                       }
    #                     }
    #                   }.to_json, { "CONTENT_TYPE" => "application/vnd.api+json" }

    result = JSON.parse(last_response.body)["data"]

# CURL format
# { "data": { "type": "captions", "relationships": { "image": { "data": { "type": "images", "id": "1" } } }, "attributes": { "caption-text": "Boo" } } }


    p "*" * 20
    p last_response
    p result
    # expect(result["id"].to_i).to be > 0
    # expect(result["type"]).to eq "images"
    # expect(result["links"]["self"]).to start_with "http://example.org/images/"
    # expect(result["attributes"]).to eq({ "image-url"=>"http://www.example.com/images/image.jpg" })
    expect(Caption.all.count).to eq 1
  end

end
