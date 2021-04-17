Rails.application.routes.draw do

  get 'shipping/index'
  get 'shipping/new'
  get 'item_detail/index'
  get 'item_detail/new'
  devise_for :users
  root to: "items#index"

  resources :items
  resources :item_datail
  resources :shipping
end
