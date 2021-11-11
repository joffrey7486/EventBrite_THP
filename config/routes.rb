Rails.application.routes.draw do
  root to: 'events#index'
  devise_for :users
  resources :users, only: [:show] do
    resources :profile_pictures, only: [:create]
  end
  resources :events do
    resources :attendances, only: [:index, :new, :create]
    resources :event_pictures, only: [:create]
  end
end
