Rails.application.routes.draw do

  resources :complains
  # Root home page for the website
  root 'home#index'

  # adding the routes for user to create user
  resources :users, only: [:new, :create]


  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'logout', to: 'sessions#destroy', as: 'logout'

end
