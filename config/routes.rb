Rails.application.routes.draw do

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end
  unauthenticated :user do
    root 'splash#index', as: :unauthenticated_root
  end
end
  resources :groups, only: [:index]
  resources :expenses, only: [:index]

end
