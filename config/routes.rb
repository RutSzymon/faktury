Faktury::Application.routes.draw do
  resources :companies, only: [:edit, :update]

  resources :contractors

  root to: "homepage#index"
end
