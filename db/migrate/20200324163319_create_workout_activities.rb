class CreateWorkoutActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :workout_activities do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :workout, null: false, foreign_key: true

      t.timestamps
    end
  end
end
