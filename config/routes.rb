Rails.application.routes.draw do
  devise_for :users
  root to: "custom_cakes#index"

  resources :users do
    resources :orders, only: [:show, :index]
    resources :requests, only: [:show, :index]
  end

  resources :products do
    resources :line_items, only: [:edit, :update, :destroy, :create]
  end
  get '/order_managment', to: 'pages#order_managment', as: :order_managment
  get '/order_managment_shop', to: 'pages#order_managment_shop', as: :order_managment_shop
  post '/send_payment', to: 'pages#send_payment', as: :send_payment
  post '/reject_request', to: 'pages#reject_request', as: :reject_request
  post 'products/add_to_basket', to: 'products#add_to_basket', as: :add_to_basket
  resources :baskets, only: :show

  resources :orders do
    resources :payments, only: :new
    post 'orders/update_quantity', to: 'orders#update_quantity', as: :update_quantity
    get 'orders/order_completed/:order_id', to: 'orders#order_completed', as: :order_completed
    get 'orders/order_failed/:order_id', to: 'orders#order_failed', as: :order_failed
  end
  resources :requests, only: [:show, :index] do
    get '/request_payment_sucessful', to: 'pages#request_payment_sucessful', as: :request_payment_sucessful
    get '/request_payment_unsucessful', to: 'pages#request_payment_unsucessful', as: :request_payment_unsucessful
  end
  post '/request_status', to: 'request_status#request_status', as: :request_status
  resources :custom_cakes do
    resources :flavours, only: [:index] do
      resources :design_details, only: [:new, :create] do
        resources :delivery_addresses, only: [:new, :create]
      end
    end
  end
end
