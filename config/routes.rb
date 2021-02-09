Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only: [:show, :edit, :update, :destroy]
  get 'users' => 'users#dummy'
  root 'homes#top'
  post '/homes/guest_sign_in', to: 'homes#new_guest' #ゲストログイン用
  resources :cooks do
    collection do
      get 'net'
      get 'plate'
      get 'pan'
      get 'dutch_oven'
      get 'pot'
      get 'other'
      get 'rank'
      get 'weekly_rank'
      get 'bookmark'
      get 'search_index'
    end
    resource :likes, only: [:create, :destroy]
    resource :bookmarks, only: [:create, :destroy]
  end
  resources :notifications, only: [:index] do
    collection do
      delete "all_destroy"
    end
  end
  resources :articles, only: [:index, :show]
end
