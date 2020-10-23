Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :articles
  resources :users_admin, controller: :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
