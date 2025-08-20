Rails.application.routes.draw do
  get "home/index"
  root "home#index"
  resources :quests, only: [ :create, :update, :destroy, :index ]

  get "/home/brag", to: "home#brag", as: :brag

  get "up" => "rails/health#show", as: :rails_health_check
end
