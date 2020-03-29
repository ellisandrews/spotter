Rails.application.routes.draw do

  # Homepage
  root 'sessions#welcome'

  # Standard model routes
  resources :exercises, only: [:index, :show, :new, :create]
  resources :muscles, only: [:index, :show]
  resources :users, only: [:index, :create, :edit, :update]
  resources :scheduled_workouts
  resources :workouts

  # User routes
  get 'signup', to: 'users#new'           # '/signup' instead of '/users/new' route
  get 'profile', to: 'users#show'         # '/profile' instead of '/users/:id'
  get 'analytics', to: 'users#analytics'  # Analytics page for a user

  # Add a workout to a user
  get 'workouts/:id/add', to: 'workouts#add', as: 'add_workout'  # Render the form
  
  # Session routes
  get 'login', to: 'sessions#new'
  post 'sessions', to: 'sessions#create'
  delete 'sessions', to: 'sessions#destroy', as: 'logout'

end
