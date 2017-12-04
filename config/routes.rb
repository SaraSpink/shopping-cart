Rails.application.routes.draw do
  root 'products#index'
  resources :accounts
  resources :order_items
  resources :orders
  resources :products
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
