Rails.application.routes.draw do

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
 
  root 'splash#index'
  resources :users
  resources :groups, only: [:index, :show, :new, :create]
  resources :expenses, only: [:index, :show, :new, :create]

end
