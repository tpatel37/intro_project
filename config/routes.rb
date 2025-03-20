Rails.application.routes.draw do
  get "transit_agencies/index"
  get "transit_agencies/show"

  # Set the homepage to Home Page
  root "pages#home"  # Change from "pages#about" to "pages#home"

  # Static Pages
  get "about", to: "pages#about"

  # RESTful Routes for Cities, Bus Routes, and Stops
  resources :cities, only: [:index, :show]
  resources :bus_routes, only: [:index, :show]
  resources :stops, only: [:index, :show]
  resources :transit_agencies, only: [:index, :show]

  # Health Check & PWA
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Search Route
  get "/search", to: "search#results"
end
