Rails.application.routes.draw do
  root to: 'application#home'
  resources :arrangements
  resources :users do
    resources :orders
  end
  get '/login', :to => 'sessions#new'
  post '/sessions', :to => 'sessions#create'
  get '/logout', :to => 'sessions#destroy'
end
