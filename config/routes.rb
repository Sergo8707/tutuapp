Rails.application.routes.draw do
  devise_for :users

  get 'search', to: 'searches#index'
  get 'result', to: 'searches#show'

  namespace :admin do
    get 'main/index'
    root 'main#index'

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

  get 'welcome/index'
  root 'welcome#index'
end
