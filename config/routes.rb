Rails.application.routes.draw do
  get 'dogs/index'
  devise_for :users
  root to: "pages#home"
  get	'/dogs', to: "pages#index"
end
