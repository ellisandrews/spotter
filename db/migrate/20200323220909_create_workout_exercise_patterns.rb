class CreateWorkoutExercisePatterns < ActiveRecord::Migration[6.0]
  def change
    create_table :workout_exercise_patterns do |t|
      t.references :exercise_pattern, null: false, foreign_key: true
      t.references :workout, null: false, foreign_key: true

      t.timestamps
    end
  end
end
