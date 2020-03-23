class WorkoutExercisePattern < ApplicationRecord
  belongs_to :exercise_pattern
  belongs_to :workout
end
