Rails.application.routes.draw do
  resources :trains do
    resources :carriages, shallow: true
  end
  resources :railway_stations do
    patch :update_position, on: :member
    patch :update_time, on: :member
  end
  resources :routes
  resources :tickets
  resources :users


  get 'search', to: 'searches#index'
  get 'result', to: 'searches#show'

  get 'welcome/index'
  root 'welcome#index'
end
