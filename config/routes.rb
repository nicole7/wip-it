Rails.application.routes.draw do
  get 'home/index'

  get 'home/profile'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
  delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :users do
    resources :comments
    resources :recipes
  end

  resources :comments
  resources :friendsips, only: [:new, :create, :destroy]
  resources :likes, only: [:new, :create, :destroy]
  resources :notifications, only: [:new, :create, :destroy]
  resources :recipes
  resources :sessions, only: [:new, :create, :destroy]

  root "recipes#show"

  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'about', to: 'about#show', as: 'about'
  get 'home/profile'

  get 'auth/:provide/callback', to: "sessions#create"
  delete 'sign_out', to: "sessions#destroy", as: 'sign_out'

end
