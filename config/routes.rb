Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # config/routes.rb
  get 'dashboard', to: 'dashboard#index', as: 'user_dashboard'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :tools, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:edit, :update, :index, :destroy]

  get 'accept_booking', to: 'bookings#accept'
end
