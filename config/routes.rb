Rails.application.routes.draw do
  get '/borrow', to: 'transactions#new'
  post '/borrow', to: 'transactions#create'
  post '/return', to: 'transactions#return'
  get '/history', to: 'transactions#full_history'
  devise_for :users
  resources :stationeries
  get "static_pages/about"
  root "static_pages#home"
end