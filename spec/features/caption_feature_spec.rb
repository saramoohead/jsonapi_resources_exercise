require 'rails_helper'

feature 'captions' do

  scenario 'exist in the API' do
    get "/captions"
    assert last_response.ok?
  end

end
