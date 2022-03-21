Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :travels do
    resources :hotels, only: [:new, :create]
    resources :activities, only: [:new, :create]
  end

  resources :hotels, only: [:destroy, :update]

  resources :activities, only: [:destroy, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
