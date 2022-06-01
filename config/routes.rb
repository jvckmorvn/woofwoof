Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :dogs, only: %i[index show create destroy]
  get "bookings/new", to: "bookings#new"
  post "bookings", to: "bookings#create"
  delete "bookings/:id", to: "bookings#destroy"
end
