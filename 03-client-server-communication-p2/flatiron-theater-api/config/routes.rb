Rails.application.routes.draw do
  resources :tickets, only: [:index, :show, :create]
  resources :users
  # resources :production_roles
  resources :productions, only: [:index, :show, :create, :update, :destroy]

#  get '/production', to: 'production#index'
end
