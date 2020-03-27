Rails.application.routes.draw do


  #get 'jap_lists/index'
  devise_for :users
  root to: 'cards#index'
  resources :feeds, only: [ :index ]
  resources :users, only: [ :show ] do
    member do
      get 'shop'
      resources :sellers, only: [ :show ]
      resources :selected_items, only: [ :create ]
    end
  end
  resources :jap_lists, only: [ :index ]
  get '/series' => 'blocs#index'
  resources :lists, only: [ :show ]
  resources :ref_cards, only: [ :index, :show ] do
    resources :cards, only: [ :new, :create ]
  end
  resources :cards, only: [ :index, :show, :destroy ]
  resources :conversations

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :blocs, only: [ :index ]
      get '/series/:id' => 'lists#show'
      resources :ref_cards, only: [ :show ]
    end
  end

end

