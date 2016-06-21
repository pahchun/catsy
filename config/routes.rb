Rails.application.routes.draw do
  devise_for :users

  resources :user do
    resource :profile, only: [:show, :destroy]
  end

  resources :categories, only: [:show]

  root "items#index"
  resources :items do
    collection do
      get 'search'
    end
  end

  get 'pages/about'

  resources :charges
end
