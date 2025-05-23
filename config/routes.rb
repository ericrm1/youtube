Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "feed#index"

  get '/watch', to: 'video#watch', as: 'video_watch'
  get "/login", to: "channel#login", as: 'login'
  get "/new_channel", to: "channel#new", as: 'new'
  get '/channel_profile', to: 'channel#index' 

  
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout', as: :logout
  post "/new_channel", to: "channel#create", as: 'channels'

  get '/video/new', to: 'video#new', as: 'new_video'
  post '/video/create', to: 'video#create', as: 'create_video'
  get '/video/list', to: 'video#list'

  get '/history', to: 'channel#history', as: 'history_channel'

  get '/comments/new', to: 'comments#new'
  post '/comments/create', to: 'comments#create', as: 'create_comment' 
  
  post '/video/:id/like', to: 'ratings#like', as: 'like_video'
  post '/video/:id/dislike', to: 'ratings#dislike', as: 'dislike_video'

  delete '/video/:channel_id/:video_id/delete', to: 'channel#delete_video', as: 'delete'
  post '/channel/:id/subscribe', to: 'subscriptions#subscribe', as: 'subscribe_channel'
  delete '/channel/:id/unsubscribe', to: 'subscriptions#unsubscribe', as: 'unsubscribe_channel'

  get '/search', to: 'search#search', as: 'search' 

end

