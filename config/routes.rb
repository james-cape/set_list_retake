Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'
  # get '/', to: 'welcome#index', as: :welcome

  resources :carts, only: [:create]
  get '/cart', to: 'carts#show'
  # post '/carts', to: 'carts#add_song'

  resources :users, only: [:new, :create, :show]
  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'

  resources :songs, only: [:index, :show]
  # get '/songs', to: 'songs#index'
  # get '/songs/:id', to: 'songs#show'

  resources :artists, only: [:new, :create, :show] do
    resources :songs, only: [:new, :create]
    # get '/artists/:artist_id/songs/new', to: 'songs#new'
    # post '/artists/:artist_id/songs', to: 'songs#create'
  end
  # get '/artists/new', to: 'artists#new'
  # post '/artists', to: 'artists#create'
  # get '/artists/:id', to: 'artists#show'

  resources :playlists, only: [:index, :new, :create]
  # get '/playlists', to: "playlists#index"

  namespace :admin do
    resources :categories, only: :index
    resources :songs, only: :destroy
  end
end
