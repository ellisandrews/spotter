class Workout < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :activities
  has_many :scheduled_workouts
  has_many :exercises, through: :activities

  # Validations
  
end
