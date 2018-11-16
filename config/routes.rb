Rails.application.routes.draw do

  get 'search_cards/index'
  get 'search_cards/show'
  get 'search_cards/new'
  root to: 'lists#index'

  resources :lists, only: [ :index, :show ]
  resources :ref_cards, only: [ :index, :show ] do
    resources :collection_cards, only: [ :new, :create ]
    resources :search_cards, only: [ :new, :create ]
  end
  resources :collection_cards, only: [ :index, :destroy ]
  resources :search_cards, only: [ :index, :show, :destroy ]

end
