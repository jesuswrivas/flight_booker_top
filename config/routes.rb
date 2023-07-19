Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "flights#index"
  resources :flights, only: [:show, :index]

  resources :bookings, only: [:new, :create, :destroy]

  resources :passengers


 

end
