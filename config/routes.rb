Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    resources :predictions
    root to: redirect("/matches"), as: :home
    resources :teams
    resources :matches
  end

  unauthenticated :user do
    root to: redirect("/users/sign_in"), as: :login
  end

  resources :users do
      member do
        post :send_points_email
      end
  end

  namespace :api do
    namespace :v1 do
      resources :login 
      resources :matches do
        collection do
          get 'test'
        end
      end
    end
  end

  root "matches#index"
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
