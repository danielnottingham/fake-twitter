Rails.application.routes.draw do
  root to: 'tweets#index'
  devise_for :users
  resources :tweets
  resources :friendships, only: %i[create destroy]

  get '/users/:id', to: 'users#show'
  get '/users', to: 'users#index'
end
