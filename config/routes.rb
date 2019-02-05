Rails.application.routes.draw do


  devise_for :users
  #root to: 'lists#index'
  root to: 'lists#index'
  resources :feeds, only: [ :index ]
  resources :users, only: [ :show ]
  resources :selected_cards, only: [ :index, :create, :destroy ]
  resources :lists, only: [ :index, :show ]

  resources :ref_cards, :shallow => true, only: [ :index, :show ] do
    #resources :collection_cards, except: [ :index ]
    resources :search_cards, except: [ :index ]
    resources :shop_cards, except: [ :index ]
  end
  #resources :collection_cards, only: [ :index ]
  resources :shop_cards, only: [ :index ]
  resources :search_cards, only: [ :index ]

  resources :conversations do
    resources :messages
  end

end
