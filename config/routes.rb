Rails.application.routes.draw do


  #get 'jap_lists/index'
  devise_for :users
  root to: 'cards#index'
  resources :feeds, only: [ :index ]
  resources :users, only: [ :show ] do
    member do
      resources :selected_items, only: [ :index, :create ]
    end
  end
  resources :jap_lists, only: [ :index ]
  resources :blocs, only: [ :index ]
  resources :lists, only: [ :show ]
  resources :ref_cards, only: [ :index, :show ] do
    resources :cards, only: [ :new, :create ]
  end
  resources :cards, only: [ :index, :show ]
  resources :conversations do
    resources :messages
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :blocs, only: [ :index ]
      resources :lists, only: [ :show ]
      resources :ref_cards, only: [ :show ]
    end
  end

end

#resources :shop_items, controller: :cards, type: 'Shop_item'
