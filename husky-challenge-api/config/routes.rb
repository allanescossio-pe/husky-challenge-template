Rails.application.routes.draw do
  resources :invoices
  resources :users, only: %i[show create update]
  namespace :user_auth_token do
    patch "renew/:email", to: "renew#update"
    get "validate/:id", to: "validate#update"
  end
  resources :login, only: :create
end
