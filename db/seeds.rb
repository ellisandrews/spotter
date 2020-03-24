# Create Users
5.times do
    User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password
    )
end

# Create Exercises
exercise_names = [
    'Bench Press',
    'Dumbell Fly',
    'Barbell Overhead Press',
    'Dumbell Curl',
    'EZ Bar Curl',
    'Seated Row',
    'Triceps Extension',
    'Squat',
    'Deadlift',
    'Calf Raise'
]

exercise_names.each do |exercise_name| 
    Exercise.create(name: exercise_name)
end

# Create Workouts
workout_names = [
    'Chest Day',
    'Push Day',
    'Pull Day',
    'Leg Day'
]

workout_names.each do |workout_name|
    Workout.create(name: workout_name)
end
