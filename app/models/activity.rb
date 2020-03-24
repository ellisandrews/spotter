class Activity < ApplicationRecord
  belongs_to :exercise
  has_many :workout_activities
  has_many :workouts, through: :workout_activities
end
