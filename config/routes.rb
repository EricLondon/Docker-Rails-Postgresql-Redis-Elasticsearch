Rails.application.routes.draw do
  devise_for :users
  resources :pages, only: [:index]
  root 'pages#index'
end
