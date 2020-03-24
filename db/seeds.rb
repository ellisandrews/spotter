# Create Users
5.times do
    User.create!(
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
    Exercise.create!(name: exercise_name)
end

# Create Activities
Exercise.all.each do |exercise|
    2.times do 
        Activity.create!(
            sets: Faker::Number.between(from: 1, to: 5),
            reps: Faker::Number.between(from: 1, to: 20),
            weight: Faker::Number.between(from: 10, to: 100),
            exercise: exercise
        )
    end
end


# Create Workouts
workout_names = [
    'Muscle Ripper',
    'Get Shredded',
    'Beach Body',
    'Bulk Up'
]

workout_names.each do |workout_name|
    Workout.create!(
        name: workout_name,
        activities: Activity.all.sample(3)
    )
end
