Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get	"dogs", to: "dogs#index"
  post "dogs", to: "dogs#create"
  get "dogs/:id", to: "dogs#show"



  # Defines the root path route ("/")
  # root "articles#index"
end
