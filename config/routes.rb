Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get	"dogs", to: "dogs#index"
  post "dogs", to: "dogs#create"
  get "bookings", to: "bookings#new"
  post "bookings", to: "bookings#create"
  delete "bookings", to: "bookings#destroy"
end
