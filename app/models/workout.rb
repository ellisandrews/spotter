class Workout < ApplicationRecord
    has_many :user_workouts
    has_many :workout_exercise_patterns
    has_many :users, through: :user_workouts
    has_many :exercise_patterns, through: :workout_exercise_patterns
end
