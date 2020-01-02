Rails.application.routes.draw do
  get "/register", to: "users#new"
  post "/register", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  get "/profile", to: "users#index"
end
