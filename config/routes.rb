Rails.application.routes.draw do
  resources :tweets
  devise_for :users
  root to: 'tweets#index'

  get '/users/:id', to: 'users#show'
  get '/users', to: 'users#index'
end
