Tapatracker::Application.routes.draw do

  resources :profile, only: [:edit, :update]

  match "dashboard", to: "dashboard#index", as: :dashboard

  resources :tapas

  devise_for :users, controllers: { registrations: "registrations" }

  root :to => 'pages#home'
end
