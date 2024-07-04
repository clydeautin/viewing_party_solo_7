Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")


  root "welcome#index"
  get '/register', to: 'users#new', as: 'register_user'
  get 'users/:user_id/top_rated_movies', to: 'top_rated_movies#index'
  get 'users/:user_id/moviews/:movie_id/viewing_party/new', to: 'viewing_party#new'
  post 'users/:user_id/movies/:movie_id/viewing_party', to: 'viewing_party#create'

  resources :users, only: [:show, :create] do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show]
  end

end
