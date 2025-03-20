Rails.application.routes.draw do
  get "transit_agencies/index"
  get "transit_agencies/show"
  # Set homepage to the About page
  root "pages#about"

  # Static Pages
  get "about", to: "pages#about"

  # RESTful Routes for Cities, Bus Routes, and Stops
  resources :cities, only: [:index, :show]
  resources :bus_routes, only: [:index, :show]
  resources :stops, only: [:index, :show]

  # Health Check & PWA
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  
  get "/search", to: "search#results"

end
