Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'pages#dashboard', as: :authenticated_root
  end
  root to: 'pages#home'
  get "/home", to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'dashboard', to: 'pages#dashboard'
  resources :users, only: [ :show ]
  resources :courses  do
    resources :occurences, only: [ :show, :new, :create, :edit, :update, :destroy ] do
      resources :bookings, only: [ :create, :destroy ]
    end
  end
end
