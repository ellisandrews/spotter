class Activity < ApplicationRecord
  # Associations
  belongs_to :exercise
  has_many :workout_activities
  has_many :workouts, through: :workout_activities

  # Validations
  validates_presence_of :sets, :reps, :weight
  # validates_associated :workouts
  # TODO: should maybe be unique on all columns so there aren't dupes?

end
