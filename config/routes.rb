Faktury::Application.routes.draw do
  resources :companies, only: [:edit, :update]

  resources :contractors

  resources :invoices do
    member do
      get :other_contractors
      get :other_products
    end
  end

  resources :products

  root to: "homepage#index"
end