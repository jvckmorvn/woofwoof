Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :dogs, only: %i[index show create destroy] do
    resources :bookings, only: :create
  end
  resources :bookings, only: %i[show destroy]
  get "/dashboard", to: "users#dashboard"
end
