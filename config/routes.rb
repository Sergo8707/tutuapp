Rails.application.routes.draw do
  resources :trains do
    resource :carriages, shallow: true
  end
  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_time, on: :member
  end
  resources :routes
  resource :search, only: [:show, :create]
  resources :tickets

  get 'welcome/index'

  root 'welcome#index'
end
