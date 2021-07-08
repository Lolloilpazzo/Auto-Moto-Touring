Rails.application.routes.draw do
 
  
  
  get 'users/index'
  devise_for :users, :path_prefix => 'id' 
  resources :users, :only =>[:show]
  
  resources :tours do
    resources :stops
    resources :comments
  end
  #root 'home#index'
  root 'home#ALL'
  get 'home/index'
  get 'home/about'
  get 'home/stat'
  get 'home/ALL'
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'
  
  
  get 'invitations/create'
  get 'invitations/destroy'
  get 'invitations/update'

  
 
 
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
