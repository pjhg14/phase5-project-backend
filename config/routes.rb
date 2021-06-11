Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :businesses, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:index, :show, :create, :update]
  resources :applications, only: [:index, :show, :create, :update, :destroy]
  resources :contacts, only: [:index, :show, :create, :update, :destroy]
  resources :conversations, only: [:index, :show, :create, :update, :destroy]


  post "/user/login", to: "users#login"
  get "/user/dashboard", to: "users#dashboard"
end
