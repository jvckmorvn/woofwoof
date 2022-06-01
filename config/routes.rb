Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :dogs, only: %i[index show create] do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:show, :destroy]
  resources :dashboards
end
