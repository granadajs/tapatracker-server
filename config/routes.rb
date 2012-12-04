Tapatracker::Application.routes.draw do

  root :to => 'pages#home'
  get "pages/home"

  devise_for :user
end
