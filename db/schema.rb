# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_25_173502) do

  create_table "activities", force: :cascade do |t|
    t.integer "sets"
    t.integer "reps"
    t.float "weight"
    t.integer "exercise_id", null: false
    t.integer "workout_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_activities_on_exercise_id"
    t.index ["workout_id"], name: "index_activities_on_workout_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "muscle_exercises", force: :cascade do |t|
    t.integer "muscle_id", null: false
    t.integer "exercise_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exercise_id"], name: "index_muscle_exercises_on_exercise_id"
    t.index ["muscle_id"], name: "index_muscle_exercises_on_muscle_id"
  end

  create_table "muscles", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "scheduled_workouts", force: :cascade do |t|
    t.date "date"
    t.boolean "completed"
    t.integer "workout_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["workout_id"], name: "index_scheduled_workouts_on_workout_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "slug"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "activities", "exercises", on_delete: :cascade
  add_foreign_key "activities", "workouts", on_delete: :cascade
  add_foreign_key "muscle_exercises", "exercises", on_delete: :cascade
  add_foreign_key "muscle_exercises", "muscles", on_delete: :cascade
  add_foreign_key "scheduled_workouts", "workouts", on_delete: :cascade
  add_foreign_key "workouts", "users", on_delete: :cascade
end
