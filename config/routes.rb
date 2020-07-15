Rails.application.routes.draw do
  devise_for :users
  get 'admin_orders/index'
  get 'admin_orders/show'
  get 'admin_users/index'
  get 'admin_users/show'
  get 'admin_users/edit'
  get 'admin_genres/index'
  get 'admin_genres/edit'
  get 'admin_products/index'
  get 'admin_products/new'
  get 'admin_products/show'
  get 'admin_products/edit'
  get 'admin_homes/top'
  get 'shipping_addresses/index'
  get 'shipping_addresses/edit'
  get 'orders/new'
  get 'orders/confirm'
  get 'orders/complete'
  get 'orders/index'
  get 'orders/show'
  get 'carts/show'
  get 'products/index'
  get 'products/show'
  get 'homes/top'
  get 'homes/about'


  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
