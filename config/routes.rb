Rails.application.routes.draw do
  resources :user, only: [:home, :signup, :signin, :signout, :index, :show, :edit, :update]
  
  root 'user#home'
  match '/signup',  to: 'user#signup',  via: [:get, :post]
  match '/signin',  to: 'user#signin',  via: [:get, :post]
  match '/signout', to: 'user#signout', via: [:delete]
  match '/users',  to: 'user#index',    via: [:get]
  get '/user/:id/today' => 'user#today', as: :today
  get '/user/:id/tomorrow' => 'user#tomorrow', as: :tomorrow
  get '/user/:id/yesterday' => 'user#yesterday', as: :yesterday
  
  #match ':controller(/:action(/:id))', via: [:get, :post]
end
