Rails.application.routes.draw do
  root "home#index"

  namespace :merchants do
    get "/dashboard", to: "dashboard#show"
  end

  namespace :admin do
    get "/dashboard", to: "dashboard#show"
  end

  #users
  get "/profile", to: "users#index"
  get "/register", to: "users#new"
  post "/register", to: "users#create"

  # session
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  #items
  get "/items", to: "items#index"
  get "/items/:id", to: "items#show"
end
