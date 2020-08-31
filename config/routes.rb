Rails.application.routes.draw do
  devise_for :users
    root to: 'items#index'
   # get 'users/sign_up', to: 'users#sign_up'
   #get 'items', to: 'items#edit'
    resources :users, only: [:index, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
