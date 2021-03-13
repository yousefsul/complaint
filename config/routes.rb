Rails.application.routes.draw do

  # adding the routes for user to create user
  resources :users, only: [:new, :create]


  # Root home page for the website
  root 'home#index'

end
