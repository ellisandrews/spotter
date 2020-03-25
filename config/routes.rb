Rails.application.routes.draw do

  # Standard model routes
  resources :activities, only: :show
  resources :exercises
  resources :users, only: [:new, :create, :show]
  resources :workouts

  # Signup alias for '/users/new' route
  get 'signup', to: 'users#new'

  # Sessions routes
  get 'login', to: 'sessions#new'
  post 'sessions', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete 'sessions', to: 'sessions#destroy'

end
