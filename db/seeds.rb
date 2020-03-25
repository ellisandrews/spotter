# Create Users
5.times do
    User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
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


# Create some Workouts for each user (with activities)
workout_terms = [
    'Muscle',
    'Ripper',
    'Shred',
    'Bulk',
    'Juice',
    'Power'
]


User.all.each do |user|
    
    3.times do

        # Make a new Workout for the user
        workout = Workout.new(
            name: workout_terms.sample(2).join(' '),  # Random name of 2 terms
            user: user
        )

        # Create 2 activities (of different exercises) for the workout
        Exercise.all.sample(2).each do |exercise|
            Activity.create!(
                sets: Faker::Number.between(from: 1, to: 5),
                reps: Faker::Number.between(from: 4, to: 15),
                weight: Faker::Number.between(from: 10, to: 100),
                exercise: exercise,
                workout: workout
            )
        end

        workout.save!  # Save the workout
        
    end
end
