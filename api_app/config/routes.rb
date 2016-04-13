Rails.application.routes.draw do
  resources :cloud_computings
  resources :users
  resources :cloud_computing
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
