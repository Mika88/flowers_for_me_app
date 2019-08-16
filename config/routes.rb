Rails.application.routes.draw do
  root to: 'application#home'

  resources :arrangements do
    resources :orders, only: [:new, :index, :show, :create]
  end

  resources :users
   
  get '/login', :to => 'sessions#new'
  post '/sessions', :to => 'sessions#create'
  get '/logout', :to => 'sessions#destroy'
  get '/auth/github/callback' => 'sessions#create'
end
