# == Route Map
#

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # devise_scope :user do
    # root to: "users/registrations#new"
  # end


  get "/users", to: "users#index"
  delete "/delete_user/:id", to: "users#destroy"

  # for sign_out
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    # get '/users/destroy/:id' => 'devise/registrations#destroy', as: :user_destroy
  end

  # root "/", products
  resources :product
  root to: "product#index"

  # users
  get "/profile", to: "users#profile"

  # addresses
  resources :address

  # orders
  resources :orders
  get "my_orders", to: "orders#my_orders"
  get 'update_order_status/:id', to: "orders#update_status", as: :update_order_status

  resources :cart
  get "my_cart", to: "cart#my_cart"
  get "/add_to_cart/:product_id", to: "cart#add_to_cart", as: :add_to_cart
  get "/increase_product_quantity/:product_id", to: "cart#increase_product_quantity", as: :increase_product_quantity
  get "/decrease_product_quantity/:product_id", to: "cart#decrease_product_quantity", as: :decrease_product_quantity
  get "/remove_product/:product_id", to: "cart#remove_product", as: :remove_product
  get "checkout", to: "cart#checkout"

  # for custom sign-up fields
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end
