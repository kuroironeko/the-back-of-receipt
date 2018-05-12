Rails.application.routes.draw do
  resources :groups do
    member do
      patch 'join'
    end
  end
  resources :products_indices
  root to: 'home#index'
  get 'home/index'


  devise_for :users, path: 'accounts'
  resources :users do
    member do
      patch 'accept'
    end
    resources :products
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
