Rails.application.routes.draw do
  root "articles#index"

  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
  # Combination CRUD of routes is called resources
  resources :articles

  get "/keywords", to: "keywords#index"
end
