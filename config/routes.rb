Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :skills, only: [ :index, :show, :edit, :update, :destroy ] do
    resources :bookings, only: [ :create ]
  end
  resources :users, only: [ :index, :show, :new, :create, :edit, :update ] do
    resources :skills, only: [ :new, :create ]
  end
  resources :bookings, only: [ :index, :show, :edit, :update ] do
    resources :reviews, only: [ :new, :create ]
  end
end

