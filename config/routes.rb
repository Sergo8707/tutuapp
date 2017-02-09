Rails.application.routes.draw do
  resources :trains do
    resource :carriages, shallow: true
  end
  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_time, on: :member
  end
  resources :routes
  resources :tickets
  resources :users

  get 'search', to: 'search#index'
  get 'result', to: 'search#show'

  get 'welcome/index'
  root 'welcome#index'
end
