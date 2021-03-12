Rails.application.routes.draw do
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }
  authenticated :user do
    root 'pages#dashboard', as: :authenticated_root
    get 'landing', to: 'pages#landing'
  end

  root to: 'pages#landing'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'dashboard', to: 'pages#dashboard'
  get 'home', to: 'pages#home'

  resources :courses  do
    resources :occurences do
      collection do
        delete 'destroy_multiple'
      end
      resources :fake_bookings, only: [:create, :destroy]
      resources :bookings, only: [ :create, :destroy ] do
      end
    end
  end

  get '/:username', to: 'users#show', as: :user
end
