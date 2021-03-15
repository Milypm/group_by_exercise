Rails.application.routes.draw do
  root 'users#show'
  
  resources :exercises
  resources :groups
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
