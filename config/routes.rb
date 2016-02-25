Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do

      get 'merchants/revenue', to: 'merchants/revenue#index'

      resources :merchants, only: [:index, :show] do

        get '/items', to: 'merchants/items#index'
        get '/invoices', to: 'merchants/invoices#index'
        get '/revenue', to: 'merchants/revenue#show'
        get '/favorite_customer', to: 'merchants/favorite#show'
        get 'customers_with_pending_invoices', to: 'merchants/pending#index'

        collection do
          get :find, to: 'merchants/find#show'
          get :find_all, to: 'merchants/find#index'
          get :random, to: 'merchants/random#show'
        end
      end

      resources :customers, only: [:index, :show] do

        get '/invoices', to: 'customers/invoices#index'
        get '/transactions', to: 'customers/transactions#index'
        get '/favorite_merchant', to: 'customers/favorite#show'

        collection do
          get :find, to: 'customers/find#show'
          get :find_all, to: 'customers/find#index'
          get :random, to: 'customers/random#show'
        end
      end

      resources :items, only: [:index, :show] do

        get '/invoice_items', to: 'items/invoice_items#index'
        get '/merchant', to: 'items/merchant#show' 

        collection do
          get :find, to: 'items/find#show'
          get :find_all, to: 'items/find#index'
          get :random, to: 'items/random#show'
        end
      end

      resources :invoices, only: [:index, :show] do

        get '/transactions', to: 'invoices/transactions#index'
        get '/invoice_items', to: 'invoices/invoice_items#index'
        get '/items', to: 'invoices/items#index'
        get '/customer', to: 'invoices/customer#index'
        get '/merchant', to: 'invoices/merchant#index'

        collection do
          get :find, to: 'invoices/find#show'
          get :find_all, to: 'invoices/find#index'
          get :random, to: 'invoices/random#show'
        end
      end

      resources :transactions, only: [:index, :show] do

        get '/invoice', to: 'transactions/invoice#index'

        collection do
          get :find, to: 'transactions/find#show'
          get :find_all, to: 'transactions/find#index'
          get :random, to: 'transactions/random#show'
        end
      end

      resources :invoice_items, only: [:index, :show] do
        get '/item', to: 'invoice_items/items#index'
        get '/invoice', to: 'invoice_items/invoice#index'

        collection do
          get :find, to: 'invoice_items/find#show'
          get :find_all, to: 'invoice_items/find#index'
          get :random, to: 'invoice_items/random#show'
        end
      end

    end
  end
end
