Rails.application.routes.draw do
  resources :trains
  resources :railway_stations
  resources :routes
  resources :carriages

  resources :cupe_carriage, controller: 'carriages', type: 'CupeCarriage'
  resources :platc_carriage, controller: 'carriages', type: 'PlatcCarriage'
  resources :seats_carriage, controller: 'carriages', type: 'SeatsCarriage'
  resources :upholstered_carriages, controller: 'carriages', type: 'UpholsteredCarriage'

  get 'welcome/index'

  root 'welcome#index'
end
