class CreateMuscleExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :muscle_exercises do |t|
      t.references :muscle, null: false, foreign_key: {on_delete: :cascade}
      t.references :exercise, null: false, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
