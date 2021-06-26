Rails.application.routes.draw do
  resources :interviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :create, :update]
  resources :applications, only: [:show, :create, :update, :destroy]
  resources :businesses, only: [:show, :create, :update, :destroy]
  resources :contacts, only: [:show, :create, :update, :destroy]
  resources :conversations, only: [:show, :create, :update, :destroy]
  resources :projects, only: [:create, :update, :destroy]
  resources :sites, only: [:create, :update, :destroy]
  resources :experiences, only: [:create, :update, :destroy]

  # model index routes (testing puropses only)
  get "/users", to: "users#index"
  get "/applications", to: "applications#index"
  get "/businesses", to: "businesses#index"
  get "/contacts", to: "contacts#index"
  get "/conversations", to: "conversations#index"

  post "/users/login", to: "users#login"
  get "/user/dashboard", to: "users#dashboard"
  get "/users/admin/:id", to: "users#admin_query"

  get "/applications/user/index", to: "applications#user_index"

  get "/businesses/user/index", to: "businesses#user_index"

  get "/contacts/user/index", to: "contacts#user_index"
end
