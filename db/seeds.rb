# Create users
5.times do
    User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Internet.password
    )
end

# Create exercises
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

