Rails.application.routes.draw do
  devise_for :users
    root to: 'products#index'
   # get 'users/sign_up', to: 'users#sign_up'
   #get 'items', to: 'items#edit'
    resources :users, only: [:index]
    resources :products, only: [:new, :create]
    # post 'products', to: 'products#create'
    #get 'post', to: 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
