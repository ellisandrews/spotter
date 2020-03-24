class CreateUserWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_workouts do |t|
      t.date :date
      t.boolean :completed
      t.references :user, null: false, foreign_key: {on_delete: :cascade}
      t.references :workout, null: false, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
