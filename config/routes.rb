Rails.application.routes.draw do
  root 'home#index'
  
  resources :exercises
  resources :groups
  resources :users
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'

  get 'external_exercises', to: 'exercises#index_nogroup'
end
