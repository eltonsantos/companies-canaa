Rails.application.routes.draw do
  devise_for :users
  
  resources :categories
  resources :members
  resources :companies

  post '/companies/get_address_by_zipcode', to: 'companies#get_address_by_zipcode'

  get "up" => "rails/health#show", as: :rails_health_check

  root "companies#index"
end
