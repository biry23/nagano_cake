Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  root to: "homes#top"
  # publicのアクション
  resources :homes, only: [:top, :about]
  resources :items, only: [:show, :index]
  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :customers, only: [:show, :edit, :update, :confirm, :withdraw]
  resources :cart_items, only: [:create, :index, :update, :destroy, :destroy_all]
  resources :orders, only: [:new, :index, :show, :confirm, :complete, :create]
  resources :addresses, only: [:edit, :index, :create, :update, :destroy]
  # adminのアクション
  resources :sessions, only: [:new, :create, :destroy]
  resources :homes, only: [:top]
  resources :items, only: [:new, :index, :create, :show, :edit, :update]
  resources :genres, only: [:edit, :index, :create, :update]
  resources :customers, only: [:show, :index, :edit, :update]
  resources :orders, only: [:show, :update]
  resources :order_details, only: [:update]
  
end
