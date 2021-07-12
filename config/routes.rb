Rails.application.routes.draw do
 
  
  
  get 'users/index'
<<<<<<< Updated upstream
  devise_for :users, :path_prefix => 'id' ,
  :controllers => { :omniauth_callbacks => 
  "users/omniauth_callbacks" }

=======
  devise_for :users, :path_prefix => 'id'
>>>>>>> Stashed changes
  resources :users, :only =>[:show]


  
  resources :tours do
      member do
        get 'join'
        delete :remove_from_tour
      end
    resources :stops
    resources :comments
    resources :memberships
  end
  #root 'tours#index'
  root 'tours#index'
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
