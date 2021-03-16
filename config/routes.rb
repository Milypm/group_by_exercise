Rails.application.routes.draw do
  root 'home#index'
  
  resources :exercises
  resources :groups
  resources :users
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
end
