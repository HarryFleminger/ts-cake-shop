Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :users
  resources :products
  resources :orders do
    resources :payments, only: :new
  end
end
