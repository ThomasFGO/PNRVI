Rails.application.routes.draw do


  get 'jap_lists/index'
  devise_for :users
  root to: 'jap_lists#index'
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
  get '/series' => 'lists#index'
  resources :lists, only: [ :show ]
  resources :ref_cards, only: [ :index, :show ] do
    resources :cards, only: [ :new, :create, :delete ]
  end
  resources :cards, except: [ :new, :create ]
  resources :conversations
  resources :messages

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :blocs do
        collection do
          get 'occi'
          get 'jap'
        end
      end
      get '/series/:id' => 'lists#show'
      resources :ref_cards, only: [ :show ]
    end
  end

end

