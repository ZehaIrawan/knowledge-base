Rails.application.routes.draw do
  devise_for :users

  root "home#index"
  # Combination CRUD of routes is called resources
  resources :articles
  resources :keywords
  get "/analytics", to: "analytics#index"
end
