Rails.application.routes.draw do
  root to: 'events#index'
  devise_for :users
  resources :users, only: [:show] 
  resources :events
  resources :attendances, only: [:index, :new, :create]
end
