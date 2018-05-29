Rails.application.routes.draw do
  resources :recipes
  resources :products, only: [:index]
  root to: 'home#index'
  #devise_for :users
end
