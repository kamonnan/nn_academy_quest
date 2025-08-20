Rails.application.routes.draw do
  root "home#index"
  resources :home, only: [ :index, :create, :update, :destroy ] do
    member { patch :toggle }
  end

  get "/home/brag", to: "home#brag", as: :brag

  post "/tasks", to: "home#create", as: :tasks

  patch "/tasks/:id/toggle_status", to: "home#toggle_status", as: :toggle_status_task

  delete "/tasks/:id", to: "home#destroy", as: :task
end
