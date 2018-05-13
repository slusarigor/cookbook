Rails.application.routes.draw do
  resources :products
  resources :recipes
  root to: 'home#index'
  devise_for :users
end
