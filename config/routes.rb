Rails.application.routes.draw do
  devise_for :users
    root to: 'products#index'
    resources :users, only: [:index]
    resources :products, only: [:new, :create, :show]
end
