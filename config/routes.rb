Tapatracker::Application.routes.draw do

  match "dashboard", to: "dashboard#index", as: :dashboard

  resources :tapas

  devise_for :users, controllers: { registrations: "registrations" }

  root :to => 'pages#home'
end
