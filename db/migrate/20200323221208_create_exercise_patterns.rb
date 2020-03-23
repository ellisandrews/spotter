class CreateExercisePatterns < ActiveRecord::Migration[6.0]
  def change
    create_table :exercise_patterns do |t|
      t.integer :sets
      t.integer :reps
      t.float :weight
      t.references :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
