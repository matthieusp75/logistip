Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  resources :orders, only: %i[index show update delete] do
    resources :order_lines, only: %i[update delete]
  end
  resources :order_lines, only: %i[create]


  get 'dashboard', to: 'pages#dashboard'
  patch 'orders/:id/validate', to: 'orders#validate', as: 'validate'


end
