Rails.application.routes.draw do
  devise_for :users
  get '/stationeries', to: 'stationeries#show'
  get "static_pages/about"
  root "static_pages#home"
end