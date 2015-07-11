require 'rails_helper'

feature 'images' do

  scenario 'exist in the API' do
    get "/images"
    assert last_response.ok?
  end

end
