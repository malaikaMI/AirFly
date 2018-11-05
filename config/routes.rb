Rails.application.routes.draw do
  devise_for :users
  resources :flights
  resources :bookings
  post "/search" => "flights#search", as: :search
  get "/manage" => "bookings#search", as: :manage
  root "flights#index"
end
