Rails.application.routes.draw do
  resources :trains
  resources :railway_stations
  get 'welcome/index'

  root 'welcome#index'
end
