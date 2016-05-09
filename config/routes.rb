Rails.application.routes.draw do
  root to: "items#index"

  # resources :items, only: [:index]
  get "/items", to: "items#index"
  # resource :cart, only: [:create, :show, :destroy, :update]
  post "/cart", to: "carts#create"
  get "/cart", to: "carts#show"
  delete "/cart", to: "carts#destroy"
  put "/cart", to: "carts#update"
  patch "/cart", to: "carts#update"

  # resource :users, only: [:create]
  post "/users", to: "users#create"

  # resources :orders, only: [:create, :index, :show]
  get "/orders", to: "orders#index", as: :orders
  post "/orders", to: "orders#create"
  get "/orders/:id", to: "orders#show", as: :order
  # post "/orders", to: "orders#create"
  # get "/orders", to: "orders#index"
  # get "/orders/:id", to: "orders#show", as: :order

  get "/login", to: "users#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/auth/github", as: :github_login
  get "/auth/github/callback", to: "sessions#create"
  get "/dashboard", to: "orders#index"

  namespace :admin do
    # get "/dashboard", to: "dashboard#show"
    # patch "/items/:id/retire", to: "items#retire", as: :retire
    # patch "/items/:id/activate", to: "items#activate", as: :activate
    # patch "/orders/:id/cancel", to: "orders#cancel", as: :cancel
    # resources :items, only: [:update] #:index, :new, :create, :edit
    # resources :orders, only: [:update] #:index
    # resources :categories, only: [:create] #new
  end

  get "/admin/dashboard", to: "admin/dashboard#show"
  patch "/admin/items/:id/retire", to: "admin/items#retire", as: :admin_retire
  patch "/admin/items/:id/activate", to: "admin/items#activate", as: :admin_activate
  patch "/admin/orders/:id/cancel", to: "admin/orders#cancel", as: :admin_cancel
  get "/admin/items", to: "admin/items#index"
  get "/admin/items/new", to: "admin/items#new", as: :new_admin_item
  post "/admin/items", to: "admin/items#create"
  get "/admin/items/:id/edit", to: "admin/items#edit", as: :edit_admin_item
  patch "/admin/items/:id", to: "admin/items#update", as: :admin_item
  get "admin/orders", to: "admin/orders#index"
  patch "admin/orders/:id", to: "admin/orders#update", as: :admin_order
  get "admin/categories", to: "admin/categories#new", as: :new_admin_category
  post "admin/categories", to: "admin/categories#create"


  get "/:name", to: "categories#show", as: :category
end
