Rails.application.routes.draw do
  resources :groups do
    member do
      post 'join'
    end
    resources :products
    resources :products_indices
  end
  root to: 'home#index'
  get 'home/index'

  post '/callback' => 'linebot#callback'
  post '/push_shopping_list' => 'linebot#push_shopping_list'

  devise_for :users, path: 'accounts'
  resources :users do
    member do
      post 'accept'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
