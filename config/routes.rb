# == Route Map
#

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # devise_scope :user do
    # root to: "users/registrations#new"
  # end

  # for sign_out
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # root "/"
  resource :products
  root to: "products#index"

  # products
  get "/products/:id", to: "products#product", as: :product_page

  # users
  get "/profile", to: "users#profile"

  # addresses
  resources :address

  # orders
  resources :orders
  get "my_orders", to: "orders#my_orders"

  # TODO use cart member or collection
  # https://guides.rubyonrails.org/routing.html#adding-collection-routes
  # cart
  resources :cart
  get "my_cart", to: "cart#my_cart"
  get "/add_to_cart/:product_id", to: "cart#add_to_cart", as: :add_to_cart
  get "/increase_product_quantity/:product_id", to: "cart#increase_product_quantity", as: :increase_product_quantity
  get "/decrease_product_quantity/:product_id", to: "cart#decrease_product_quantity", as: :decrease_product_quantity
  get "/remove_product/:product_id", to: "cart#remove_product", as: :remove_product
  get "checkout", to: "cart#checkout"

  # resources :cart do
  #   member do
  #     get :checkout
  #     get :add_to_cart, path: 'add_to_cart/:product_id'
  #     get :increase_product_quantity, path: 'increase_product_quantity/:product_id'
  #     get :decrease_product_quantity, path: 'decrease_product_quantity/:product_id'
  #     get :remove_product, path: 'remove_product/:product_id'
  #   end
  # end
  # resources :carts do
  #   get 'add_to_cart/:product_id', to: 'carts#add_to_cart', as: :add_to_cart, on: :collection
  #   get 'increase_product_quantity/:product_id', to: 'carts#increase_product_quantity', as: :increase_product_quantity, on: :collection
  #   get 'decrease_product_quantity/:product_id', to: 'carts#decrease_product_quantity', as: :decrease_product_quantity, on: :collection
  #   get 'remove_product/:product_id', to: 'carts#remove_product', as: :remove_product, on: :collection
  #   get 'checkout', to: 'carts#checkout', on: :collection
  # end

  # for custom sign-up fields
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end
