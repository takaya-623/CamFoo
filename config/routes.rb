Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
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
end
