Rails.application.routes.draw do


  resources :home

  resources :registered_apps
  devise_for :users

  root 'home#index'

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end

end
