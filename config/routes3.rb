Rails.application.routes.draw do

  namespace :cockpit do
    resources :test, :big5, :genre, :tracks
    root 'cockpit#index'
    get '/test/:id/profile' => 'test#profile', as: :test_profile
    patch '/test/:id/profile' => 'test#profiling', as: :test_profiling
    get '/test/:id/ocean' => 'test#ocean', as: :test_ocean
    patch '/test/:id/ocean' => 'test#oceaning', as: :test_oceaning
  end

  resources :test, only: [:index, :show, :update]
  put '/test/:id/poll'  => 'test#poll_update'
  get '/test/:id/reset' => 'test#reset'

  resources :result, only: [:index, :show, :update]
  get '/result/:id/feedback' => 'result#feedback', as: :result_feedback
  get '/result/:id/share' => 'result#share', as: :result_share

  get '/start(/)' => redirect('/')
  get '/start/:slug' => 'app#start', as: :start

  get '/user/signin' => 'user#signin', as: :signin

  match ':controller(/:action(/:id))', via: [:get, :post]
  root 'app#index'

  match '/404', to: 'errors#file_not_found', via: :all

end
