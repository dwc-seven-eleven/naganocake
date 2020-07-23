Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about'
  resources :products, only: [:index, :show]
  resources :carts, only: [:index, :create, :update, :destroy]
  delete 'carts' => 'carts#destroy_all', as: 'destroy_all_carts'
  get 'orders/confirm' => 'orders#confirm'
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/complete' => 'orders#complete'
  get 'orders/new' => 'orders#new'
  post 'orders/new' => 'orders#new'
  resources :orders, only: [:index, :create, :show]
  resources :users, only: [:show, :edit, :update] do
    member do
      get 'user/:id/leave' => 'users#leave', as: 'leave_user'
      patch "withdrawl"
    end
  end
  resources :shipping_addresses, only: [:index, :create, :destroy, :edit, :update]
  get 'admin_homes/top' => 'admin_homes#top'
  resources :admin_products, only: [:index, :new, :create, :show, :edit, :update]
  resources :admin_genres, only: [:index, :show, :create, :edit, :update, :destroy]
  resources :admin_users,only: [:index, :show, :update, :edit]
     resources :admin_orders do
    get 'today' , :on => :collection
    get 'detail' , :on => :member
  end
  resources :admin_orders, only: [:index, :show, :update]

  # get 'admin_orsers/detail/' => 'admin_orsers#detail'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
