Rails.application.routes.draw do
  devise_for :users
  
  resources :categories
  resources :members
  resources :companies do
    collection do
      get :export_to_xls_companies
    end
  end

  post '/companies/get_address_by_zipcode', to: 'companies#get_address_by_zipcode'

  get "up" => "rails/health#show", as: :rails_health_check

  root "companies#index"
end
