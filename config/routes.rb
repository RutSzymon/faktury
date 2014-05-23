Faktury::Application.routes.draw do
  resources :companies, only: [:edit, :update]

  resources :contractors

  resources :products

  root to: "homepage#index"
end