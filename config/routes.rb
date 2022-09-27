Rails.application.routes.draw do
  resources :predictions
  resources :teams
  resources :matches
  devise_for :users
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
