Rails.application.routes.draw do

  root to: 'blocs#index'

  resources :blocs, only: [ :index ]
  resources :lists, only: [ :show ]
  resources :ref_cards, only: [ :index, :show ] do
    resources :collection_cards, only: [ :new, :create ]
  end
  resources :collection_cards, only: [ :index ]

end
