Rails.application.routes.draw do

  root to: 'lists#index'

  resources :lists, only: [ :index, :show ]

  resources :ref_cards, :shallow => true, only: [ :index, :show ] do
    resources :collection_cards, except: [ :index ]
    resources :search_cards, except: [ :index ]
    resources :shop_cards, except: [ :index ]
  end
  resources :collection_cards, only: [ :index ]
  resources :shop_cards, only: [ :index ]
  resources :search_cards, only: [ :index ]



end
