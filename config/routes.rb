Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "feed#index"

  get "/watch", to: "video#watch", as: 'watch'
  get "/login", to: "channel#login", as: 'login'
  get "/new_channel", to: "channel#new", as: 'new'

  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout', as: :logout
  post "/new_channel", to: "channel#create", as: 'channels'
end

