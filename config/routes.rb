Rails.application.routes.draw do
  devise_for :users
    root to: 'products#index'
    resources :users, only: [:index]
    resources :products do
      resources :buyers, only: [:index, :create]
      collection do
        get 'product'
      end
    end
end