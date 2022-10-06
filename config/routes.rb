Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    resources :predictions
  end



  resources :teams
  resources :matches

  resources :users do
      member do
        post :send_points_email
      end
  end

  root "matches#index"
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
