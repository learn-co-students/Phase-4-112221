Rails.application.routes.draw do
  resources :tickets, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:show, :create, :update, :destroy]
  resources :production_roles
  resources :productions, only: [:index, :show, :create, :destroy]
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'
  get '/authorized_user', to: "users#show"

#  get '/production', to: 'production#index'
end
