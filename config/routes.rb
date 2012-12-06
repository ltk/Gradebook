Gradebook::Application.routes.draw do
  resources :semesters


  resources :teaching_assignments


  resources :users
  resources :sessions, :only => [:new, :create]

  resources :courses do
    resources :enrollments
    resources :teaching_assignments
  end

  match "logout", :via => :delete, :to => "sessions#destroy", :as => "logout"
  match "login", :via => :get, :to => "sessions#new", :as => "login"
  match "dashboard", :via => :get, :to => "dashboard#index", :as => "dashboard"
  match "admin", :via => :get, :to => "admin_dashboard#index", :as => "admin_dashboard"

  root :to => "home#index"
end
