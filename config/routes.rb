Travel::Application.routes.draw do
  root to: 'home#index'

  resource :users
  resource :sessions, only: [:create]
  resources :travel_groups

  get '/signup' => 'users#new', as: 'signup'
  get '/login' => 'sessions#new', as: 'login'
  delete '/logout' => 'sessions#destroy'


  get 'auth/:provider/callback' => 'oauth#create'
  get 'auth/failure' => 'oauth#fail'
  get '/auth/facebook', as: 'facebook_oauth'


  post '/join_group' => "travel_groups#join_group"



  namespace :api do
    get '/users.json' => 'test#index'
  end

end
