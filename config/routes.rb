Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  get 'cooks/net'
  get 'cooks/plate'
  get 'cooks/pan'
  get 'cooks/dutch_oven'
  get 'cooks/other'
  get 'cooks/rank'
  resources :cooks do
    resource :likes, only: [:create, :destroy]
  end
  root 'homes#top'
end
