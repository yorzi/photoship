Rails.application.routes.draw do

  root "searches#index"

  get "fetch_more", to: "searches#fetch_more"

  resources :searches, only: :create
end
