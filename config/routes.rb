Tapatracker::Application.routes.draw do
  resources :tapas

  devise_for :users
  root :to => 'pages#home'
  get "pages/home"
end
