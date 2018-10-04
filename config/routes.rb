Rails.application.routes.draw do
  get 'collection_cards/index'
  get 'collection_cards/new'
  get 'collection_cards/create'
  get 'collection_cards/delete'
  get 'ref_cards/show'
  get 'lists/show'
  root to: 'blocs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blocs, only: [ :index ]
  resources :lists, only: [ :show ]
  resources :ref_cards, only: [ :index, :show ]

end
