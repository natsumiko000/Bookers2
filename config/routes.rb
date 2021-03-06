Rails.application.routes.draw do
  root 'welcome#index'
  get '/home/about', to: 'welcome#about'

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update]
  resources :books
end
