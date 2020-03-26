Rails.application.routes.draw do

  # Homepage
  root 'sessions#welcome'

  # Standard model routes
  resources :exercises
  resources :muscles, only: [:index, :show]
  resources :users, only: [:show, :new, :create, :edit, :update]
  resources :scheduled_workouts
  resources :workouts

  # Add a workout to a user
  get 'workouts/:id/add', to: 'workouts#add', as: 'add_workout'  # Render the form
  
  # Signup alias for '/users/new' route
  get 'signup', to: 'users#new'

  # Sessions routes
  get 'login', to: 'sessions#new'
  post 'sessions', to: 'sessions#create'
  delete 'sessions', to: 'sessions#destroy', as: 'logout'

end
