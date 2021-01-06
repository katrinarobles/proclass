Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'dashboard', to: 'pages#dashboard'
  resources :courses  do
    resources :occurences, only: [ :show, :new, :create, :edit, :update, :destroy ] do
      resources :bookings, only: [ :create, :destroy ]
    end
  end
end
