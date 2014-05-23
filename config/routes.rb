Faktury::Application.routes.draw do
  resources :companies, only: [:edit, :update]

  resources :contractors

  resources :invoices do
    get :other_contractors, on: :member
  end

  resources :products

  root to: "homepage#index"
end