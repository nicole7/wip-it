Rails.application.routes.draw do
  
#   devise_for :users

#   devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

#   devise_scope :user do
#   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
#   end

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

  root "recipes#new"

  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'about', to: 'about#show', as: 'about'

  get 'home/profile'

  get 'auth/:provide/callback', to: "sessions#create"
  delete 'sign_out', to: "sessions#destroy", as: 'sign_out'


end
