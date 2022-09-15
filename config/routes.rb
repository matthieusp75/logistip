Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#dashboard'
  resources :orders, only: %i[index show update delete] do
    resources :order_lines, only: %i[update delete]
  end
  resources :order_lines, only: %i[create]
end
