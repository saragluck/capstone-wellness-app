Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  # Sleep actions
  get "/sleeps" => "sleeps#index"
  get "/sleeps/:id" => "sleeps#show"
  post "/sleeps" => "sleeps#create"
  patch "/sleeps/:id" => "sleeps#update"
  delete "/sleeps/:id" => "sleeps#destroy"

  # Water actions
  get "/waters" => "waters#index"
  get "/waters/:id" => "waters#show"
  post "/waters" => "waters#create"
  patch "/waters/:id" => "waters#update"
  delete "/waters/:id" => "waters#destroy"

  # Goal actions
  get "/goals" => "goals#index"
  et "/goals/:id" => "goals#show"
  post "/goals" => "goals#create"
  patch "/goals/:id" => "goals#update"
  delete "/goals/:id" => "goals#destroy"
end
