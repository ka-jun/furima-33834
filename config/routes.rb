Rails.application.routes.draw do
  devise_for :users

  get 'shipping/index'
  get 'shipping/new'
  get 'item_detail/index'
  get 'item_detail/new'

  root to: "items#index"
  resources :items
  resources :item_datails
  resources :shippings
end
