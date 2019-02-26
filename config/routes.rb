Rails.application.routes.draw do
  root to: 'application#home'
  resources :arrangements
  resources :users
  get '/login', :to => 'sessions#new'
  post '/sessions', :to => 'sessions#create'
  get '/logout', :to => 'sessions#destroy'
end
