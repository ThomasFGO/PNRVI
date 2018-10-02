Rails.application.routes.draw do
  get 'ref_cards/show'
  get 'lists/show'
  root to: 'blocs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :blocs, only: [ :index ]
  resources :lists, only: [ :show ]
  resources :ref_cards, only: [ :show ]

end
