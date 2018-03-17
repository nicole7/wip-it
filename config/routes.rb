Rails.application.routes.draw do


  devise_for :users
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



  root "recipes#new"

  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'about', to: 'about#show', as: 'about'
  get 'racer', to: 'racer#show', as: 'racer'
  get 'tictac', to: 'tictac#show', as: 'tictac'

end
