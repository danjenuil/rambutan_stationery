Rails.application.routes.draw do
  get '/borrow', to: 'transactions#new'
  post '/borrow', to: 'transactions#create'
  devise_for :users
  resources :stationeries
  get "static_pages/about"
  root "static_pages#home"
end