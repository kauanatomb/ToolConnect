Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :booking, only: [:new, :create, :edit, :update] do
    resources :tool, only: [:index, :show, :new, :create]
  end
  resources :tool, only: :destroy
end
