Rails.application.routes.draw do

  # Root home page for the website
  root 'home#index'



  # adding the routes for user to create user
  get 'register', to: 'registrations#new'

  post 'register', to: 'registrations#create'

  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'


  resources :complains

end
