Rails.application.routes.draw do
  get "/register", to: "users#new"
  post "/register", to: "users#create"

  get "/profile", to: "users#index"
end
