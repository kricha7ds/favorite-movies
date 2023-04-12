Rails.application.routes.draw do
  resources :fave_movies
  resources :movie_lists
  resources :movies, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root "movies#index"
  root "movie_lists#index"
end
