Rails.application.routes.draw do
  resources :movie_lists
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root "movies#index"
  root "movie_lists#index"
end
