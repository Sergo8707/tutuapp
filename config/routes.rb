Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :trains do
      resources :carriages, shallow: true
    end
    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_time, on: :member
    end

    resources :routes
    resources :tickets
  end

  resources :tickets, only: [:index, :new, :create, :show, :destroy]

  get 'search', to: 'searches#index'
  get 'result', to: 'searches#show'

  get 'welcome/index'
  root 'welcome#index'
end
