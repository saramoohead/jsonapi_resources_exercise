Rails.application.routes.draw do

jsonapi_resources :images
jsonapi_resources :captions

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

end
