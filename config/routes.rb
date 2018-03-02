Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :comments
  resources :friendsips, only: [:new, :create, :destroy]
  resources :likes, only: [:new, :create, :destroy]
  resources :notifications, only: [:new, :create, :destroy]
  resources :recipes
  resources :sessions, only: [:new, :create, :destroy]

  root "recipes#new"

  get 'logout', to: "sessions#destroy", as: 'logout'

end
