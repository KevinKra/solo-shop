Rails.application.routes.draw do
  root "home#index"

  namespace :merchants do
    get "/dashboard", to: "dashboard#show"
  end

  namespace :admin do
    get "/dashboard", to: "dashboard#show"
  end

  get "/register", to: "users#new"
  post "/register", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  get "/profile", to: "users#index"
end
