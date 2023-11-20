Rails.application.routes.draw do
  get 'dashboard/index'
  get 'users/new'
  get 'sessions/new'
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'welcome#index'

  # login
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  #register
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'

  #dashboard
  get 'dashboard', to: 'dashboard#index'
end
