Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users

  resources :users, only: [:show]
  resources :books, only: [:new, :create, :index, :show]
end
