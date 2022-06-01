Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :dogs, only: %i[index show create] do
    post "bookings", to: "bookings#create"
  end
end
