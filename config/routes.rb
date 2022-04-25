Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/profiles", to: "profiles#dashboard", as: :profile

  resources :travels do
    resources :hotels, only: %i[new create]
    resources :activities, only: %i[new create]
    resources :transports, only: %i[new create]
    resources :bookings, only: %i[new create]
  end

  resources :hotels, only: %i[destroy update]
  resources :activities, only: %i[destroy update]
  resources :transports, only: %i[destroy update]
end
