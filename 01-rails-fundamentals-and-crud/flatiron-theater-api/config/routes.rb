Rails.application.routes.draw do
  # resources :production_roles
  resources :productions, only: [:index, :show]
end
