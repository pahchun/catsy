Rails.application.routes.draw do
  devise_for :users

  resources :user do
    resource :profile, only: [:show]
  end

  root "items#index"
  resources :items
end
