Rails.application.routes.draw do

  devise_for :users, :skip => [:registrations]

  devise_for :users, :controllers => {
    :registrations => "registrations"
  }

  authenticated :user do
    devise_scope :user do
      root 'pages#dashboard', as: :authenticated_root
      get 'home', to: 'pages#home'
    end
  end

  unauthenticated do
    devise_scope :user do
      root to: "registrations#new", :as => "unauthenticated"
    end
  end


  # devise_for :users, controllers: {
  #   confirmations: 'confirmations'
  # }
  # authenticated :user do
  #   root 'pages#dashboard', as: :authenticated_root
  #   get 'home', to: 'pages#home'
  # end
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'dashboard', to: 'pages#dashboard'

  resources :courses  do
    resources :occurences do
      collection do
        delete 'destroy_multiple'
      end
      resources :bookings, only: [ :create, :destroy ] do
      end
    end
  end

  get '/:username', to: 'users#show', as: :user
end
