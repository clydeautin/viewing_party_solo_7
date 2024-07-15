Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")


  root "welcome#index"
  get '/register', to: 'users#new', as: 'register_user'
  post '/register', to: 'users#create'
  get 'users/:user_id/top_rated_movies', to: 'top_rated_movies#index'
  get "/login", to: "users#login_form"
  post "/login", to: "users#login"

  resources :users, only: [:show, :create, :new] do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show] do
      resources :viewing_party, only: [:show, :create, :new]
      resources :similar_movies, only: [:index]
    end
  end

end
