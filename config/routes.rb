Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :users do
    resources :comments
    resources :recipes
    resources :posts
  end

  resources :friendships

  resources :comments
  resources :likes, only: [:new, :create, :destroy]
  resources :notifications, only: [:new, :create, :destroy]
  resources :recipes
  resources :sessions, only: [:new, :create, :destroy]

  resources :posts

  root "recipes#index"

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/friendship' => 'friendships#index'

  get '/register' => 'users#new'
  post '/users' => 'users#create'

  get 'about', to: 'about#show'
  get 'search', to: 'search#index'

  get 'favorite', to: 'favorite#to_favorite', via: :post
  get 'un_favorite', to: 'favorite#un_favorite', via: :delete
  get 'requests', to: 'requests#index'
  # get 'profile', to: 'users/#{current_user.id}', as: 'profile'


end
