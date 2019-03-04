Rails.application.routes.draw do
  root to: 'application#home'
  resources :arrangements
  resources :users do
    resources :orders, only: [:new, :index, :show, :create]
  end
  get '/login', :to => 'sessions#new'
  post '/sessions', :to => 'sessions#create'
  get '/logout', :to => 'sessions#destroy'
  get '/auth/github/callback' => 'sessions#create'
end
