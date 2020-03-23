class ExercisePattern < ApplicationRecord
  belongs_to :exercise
  has_many :workout_exercise_patterns
  has_many :workouts, through: :workout_exercise_patterns
end
