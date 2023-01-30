Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :users
  resources :products
  post 'products/add_to_basket', to: 'products#add_to_basket', as: :add_to_basket
  resources :orders do
    resources :payments, only: :new
  end
end
