Rails.application.routes.draw do
  devise_for :users
  resources :predictions
  resources :teams
  resources :matches
  resources :users
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "matches#index"
end
