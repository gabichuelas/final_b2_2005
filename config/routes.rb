Rails.application.routes.draw do

  # resources :airlines, only: [:index] do
  #   resources :flights, only: [:show]
  # end

  # resources :airlines, only: [:index]

  resources :flights, only: [:show]
  resources :passengers, only: [:show]
  resources :flight_passengers, only: [:create]
end
