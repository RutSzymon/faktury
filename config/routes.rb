Faktury::Application.routes.draw do
  resources :companies, only: [:edit, :update]

  root to: "homepage#index"
end
