Rails.application.routes.draw do


  get 'jap_lists/index'
  devise_for :users
  root to: 'lists#index'
  resources :feeds, only: [ :index ]
  resources :users, only: [ :show ]
  resources :jap_lists, only: [ :index ]
  resources :lists, only: [ :index, :show ]
  resources :ref_cards, only: [ :index, :show ]
  resources :cards do
    resources :shop_items, controller: :items, type: 'Shop_item'
  end
  resources :conversations do
    resources :messages
  end

end
