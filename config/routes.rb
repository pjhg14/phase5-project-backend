Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :create, :update]
  resources :applications, only: [:show, :create, :update, :destroy]
  resources :businesses, only: [:show, :create, :update, :destroy]
  resources :contacts, only: [:show, :create, :update, :destroy]
  resources :conversations, only: [:show, :create, :update, :destroy]

  # model index routes (testing puropses only)
  get "/users", to: "users#index"
  get "/applications", to: "applications#index"
  get "/businesses", to: "businesses#index"
  get "/contacts", to: "contacts#index"
  get "/conversations", to: "conversations#index"

  # TODO: finish user routes, refactor fromntend lists to query for content instead of using a store
  post "/users/login", to: "users#login"
  get "/user/dashboard", to: "users#dashboard"
  get "/users/admin/:id", to: "users#admin_query"

  # post "/applications/apply", to: "applications#apply"
  get "/applications/userquery", to: "applications#query"

  get "/businesses/userquery", to: "businesses#query"

  get "/contacts/userquery", to: "contacts#query"
end
