Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "feed#index"

  get "/watch", to: "video#watch", as: 'watch'
  get "/login", to: "user#login", as: 'login'
  get "/new_user", to: "user#new", as: 'new'

  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'
  post "/new_user", to: "user#create", as: 'users'
end

