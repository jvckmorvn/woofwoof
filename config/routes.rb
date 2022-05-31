Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get	"dogs", to: "dogs#index"
  get "dogs/new", to: "dogs#new"
  post "dogs", to: "dogs#create"
  get "bookings/new", to: "bookings#new"
  post "bookings", to: "bookings#create"
  delete "bookings/:id", to: "bookings#destroy"
end
