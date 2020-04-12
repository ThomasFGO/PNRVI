Rails.application.routes.draw do


  #get 'jap_lists/index'
  devise_for :users
  root to: 'cards#index'
  resources :feeds, only: [ :index ]
  resources :users, only: [ :show ] do
    member do
      get 'shop'
      resources :search_cards, only: [ :index ]
      resources :sellers do
        member do
          get 'panier'
          get 'conversation'
        end
      end
      resources :buyers do
        member do
          get 'demande'
          get 'conversation'
        end
      end
      resources :selected_items, only: [ :create ]
    end
  end
  resources :ref_cards, only: [ :index ]
  resources :jap_lists, only: [ :index ]
  get '/series' => 'blocs#index'
  resources :lists, only: [ :show ]
  resources :ref_cards, only: [ :index, :show ] do
    resources :cards, only: [ :new, :create ]
  end
  resources :cards, except: [ :new, :create ]
  resources :conversations
  resources :messages

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :blocs, only: [ :index ]
      get '/series/:id' => 'lists#show'
      resources :ref_cards, only: [ :show ]
    end
  end

end

