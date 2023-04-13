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

  # for custom sign-up fields
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end
