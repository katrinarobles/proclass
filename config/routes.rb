Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  authenticated :user do
    root 'pages#dashboard', as: :authenticated_root
    get 'home', to: 'pages#home'
  end
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'dashboard', to: 'pages#dashboard'
  resources :courses  do
    resources :occurences do
      resources :bookings, only: [ :create, :destroy ]
    end
  end

  get '/:username', to: 'users#show', as: :user
end
