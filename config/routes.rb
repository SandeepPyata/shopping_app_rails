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
  root to: "products#index"

  # products
  resource :products
  get "/products/:id", to: "products#product", as: :product_page

  # users
  get "/profile", to: "users#profile"

  # addresses
  resource :addresses
  get "/new_address", to: "addresses#new_address_form"
  post "/add_address", to: "addresses#add_new_address"
  get "/addresses/update/:id", to: "addresses#address_update_form", as: :address_update

  # orders
  resource :orders
  get "my_orders", to: "orders#my_orders"

  # cart
  resources :cart
  get "my_cart", to: "cart#my_cart"
  get "/add_to_cart/:product_id", to: "cart#add_to_cart", as: :add_to_cart
  get "/increase_product_quantity/:product_id", to: "cart#increase_product_quantity", as: :increase_product_quantity
  get "/decrease_product_quantity/:product_id", to: "cart#decrease_product_quantity", as: :decrease_product_quantity


  # for custom sign-up fields
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end
