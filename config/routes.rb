Rails.application.routes.draw do

  resources :activities, only: :show
  resources :exercises
  resources :workouts

end
