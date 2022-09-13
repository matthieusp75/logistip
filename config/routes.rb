Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :orders, only: %i[index show update delete] do
    resources :order_line, only: %i[create update delete]
  end


  get 'dashboard', to: 'pages#dashboard'
  
end
