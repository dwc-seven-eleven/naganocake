Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about'
  resources :products, only: [:index, :show]
  resources :carts, only: [:show, :create, :update, :destroy, :destroy_all]
  resources :orders, only: [:index, :new, :create :show, :confirm, complete]
  resources :users, only: [:show, :leave, :edit, :update]
  resources :shipping_addresses, only: [:index, :create, :destroy, :edit, :update]
  get 'admin_homes/top' => 'admin_homes#top'
  resources :admin_products, only: [:index, :new, :create, :show, :edit, :update]
  resources :admin_genres, only: [:index, :create, :edit, :update]
  resources :admin_users,only: [:index, :show, :update, :edit]
  resources :admin_orders, only: [:index, :show, :update]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
