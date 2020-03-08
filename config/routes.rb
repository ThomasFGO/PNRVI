Rails.application.routes.draw do


  #get 'jap_lists/index'
  devise_for :users
  root to: 'lists#index'
  resources :feeds, only: [ :index ]
  resources :users, only: [ :show ]
  resources :jap_lists, only: [ :index ]
  resources :lists, only: [ :index, :show ]
  resources :ref_cards, only: [ :index, :show ] do
    resources :cards, only: [ :new, :create ]
  end
  resources :cards, only: [ :show ]
  resources :conversations do
    resources :messages
  end

end

#resources :shop_items, controller: :cards, type: 'Shop_item'
