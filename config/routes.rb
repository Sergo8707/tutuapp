Rails.application.routes.draw do
  resources :trains
  resources :railway_stations
  resources :routes
  resources :carriage

  get 'welcome/index'

  root 'welcome#index'
end
