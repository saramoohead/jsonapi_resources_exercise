require 'rails_helper'

feature 'captions' do

  scenario 'exist in the API' do
    get "images/1/caption"
    assert last_response.ok?
  end

end
