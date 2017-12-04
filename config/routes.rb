Rails.application.routes.draw do
  root 'landing_page#index'
  resources :accounts
  resources :order_items
  resources :orders
  resources :products
  resources :landing_page, :only => :index
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
