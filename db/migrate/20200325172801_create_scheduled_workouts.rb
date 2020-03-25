class CreateScheduledWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :scheduled_workouts do |t|
      t.date :date
      t.boolean :completed
      t.references :workout, null: false, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
