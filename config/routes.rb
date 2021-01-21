Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  get 'cooks/net'
  get 'cooks/plate'
  get 'cooks/pan'
  get 'cooks/dutch_oven'
  get 'cooks/other'
  resources :cooks
  root 'homes#top'
end
