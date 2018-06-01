Rails.application.routes.draw do


  resources :home

  resources :registered_apps
  devise_for :users

  root 'home#index'

  resources :registered_apps

end
