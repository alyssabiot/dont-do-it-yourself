Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  resources :skills, only: [ :index, :show, :edit, :update ] do
    resources :bookings, only: [ :new, :create ]
  end
  resources :users, only: [ :index, :show, :new, :create, :edit, :update ] do
    resources :skills, only: [ :new, :create ]
  end
  resources :bookings, only: [ :index, :show, :edit, :update ]
end
