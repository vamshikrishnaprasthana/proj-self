Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homes#welcome'
  resources :products
  resources :categories
  resources :users
  resources :orderitems
  resources :orders
  resource:carts do
    member do
      get 'add_to_cart'
    end
  end
end
