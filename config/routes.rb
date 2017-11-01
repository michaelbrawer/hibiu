Rails.application.routes.draw do
  # get 'users/new'

  # get 'users/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "posts#index"
  get 'tags/:id', to: 'tags#show'
  get '/login', to: 'sessions#new', as: 'login'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts do
    resources :comments, shallow: true
  end
  resources :tags, shallow: true
  
end

