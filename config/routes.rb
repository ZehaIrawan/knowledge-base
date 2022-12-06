Rails.application.routes.draw do
  devise_for :users

  root "articles#index"

  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
  # Combination CRUD of routes is called resources
  resources :articles
  resources :keywords
  # get "/keywords", to: "keywords#index"
end
