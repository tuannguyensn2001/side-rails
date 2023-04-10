Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/api/v1/auth/register", to: "auth#register"
  post "/api/v1/auth/login", to: "auth#login"
  get "/api/v1/auth/me", to: "auth#get_me"
end
