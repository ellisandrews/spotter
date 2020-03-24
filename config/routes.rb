Rails.application.routes.draw do

  resources :workouts, only: [:index, :show, :new, :create]

end
