Rails.application.routes.draw do
  resources :user, only: [:home, :signup, :signin, :signout, :index, :show]
  
  root 'user#home'
  match '/signup',  to: 'user#signup',  via: [:get, :post]
  match '/signin',  to: 'user#signin',  via: [:get, :post]
  match '/signout', to: 'user#signout', via: [:delete]
  match '/users',  to: 'user#index',    via: [:get]
  #get 'user/signin' 
  #get '/user/signin' => 'user#signin', as: :signin 
  #get 'user/signup'
  #get '/user/signup' => 'user#signup', as: :signup
  #match ':controller(/:action(/:id))', via: [:get, :post]
end
