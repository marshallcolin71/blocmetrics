Rails.application.routes.draw do


  resources :home

  resources :registered_apps
  devise_for :users

  root 'home#index'

  get 'about' => 'home#about'

end
