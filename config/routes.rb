Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy]
  get 'users' => 'users#dummy'
  root 'homes#top'
  resources :cooks do
    collection do
      get 'net'
      get 'plate'
      get 'pan'
      get 'dutch_oven'
      get 'pot'
      get 'other'
      get 'rank'
      get 'bookmark'
      get 'search_index'
    end
    resource :likes, only: [:create, :destroy]
    resource :bookmarks, only: [:create, :destroy]
  end
  resources :notifications, only: :index
  resources :articles, only: [:index, :show]
end
