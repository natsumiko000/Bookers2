Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, controllers: {
    sessions:      "users/sessions",
    registrations: "users/registrations",
    passwords:     'users/passwords',
    confirmations: "users/confirmations"
  }
end
