Gradebook::Application.routes.draw do
  resources :users
  resources :sessions, :only => [:new, :create]

  match "logout", :via => :delete, :to => "sessions#destroy", :as => "logout"
  match "login", :via => :get, :to => "sessions#new", :as => "login"

  root :to => "home#index"
end
