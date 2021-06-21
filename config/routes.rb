Rails.application.routes.draw do
 
  devise_for :users
  resources :tours
  #root 'home#index'
  root 'home#ALL'
  get 'home/index'
  get 'home/about'
  get 'home/stat'
  get 'home/ALL'
 
 
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
