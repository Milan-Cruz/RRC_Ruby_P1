Rails.application.routes.draw do
  # get "categories/index"
  # get "categories/show"
  # get "jokes/index"
  # get "jokes/show"

  root "jokes#index"

  # Use resource routing for jokes and categories
  resources :jokes, only: [:index, :show]
  resources :categories, only: [:index, :show]

  # Reveal health status on /up
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Define the root path route ("/")
  # Example: root "home#index"
end
