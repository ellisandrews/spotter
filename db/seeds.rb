# Create Users
5.times do
    User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: Faker::Internet.password
    )
end


# Create Exercises and Muscles
exercise_muslces = {
    'Bench Press' => ['Pectorals', 'Triceps', 'Deltoids'],
    'Dumbell Fly' => ['Pectorals'],
    'Barbell Overhead Press' => ['Deltoids', 'Trapezius'],
    'Dumbell Curl' => ['Biceps'],
    'EZ Bar Curl' => ['Biceps'],
    'Seated Row' => ['Latissimus Dorsi', 'Biceps'],
    'Triceps Extension' => ['Triceps'],
    'Squat' => ['Quadriceps', 'Glutes'],
    'Deadlift' => ['Hamstrings', 'Glutes'],
    'Calf Raise' => ['Calves']
}

exercise_muslces.each do |exercise_name, muscle_names|

    exercise = Exercise.create!(name: exercise_name)

    muscle_names.each do |muscle_name|
        exercise.muscles << Muscle.find_or_create_by!(name: muscle_name)
    end

end

# Create some Workouts/Activities/ScheduledWorkouts for each User
workout_terms = [
    'Muscle',
    'Ripper',
    'Shred',
    'Bulk',
    'Juice',
    'Power',
    'Body',
    'Mass'
]

User.all.each do |user|
    
    # Make 2 Workouts
    2.times do

        # Make a new Workout for the User
        workout = Workout.new(
            name: workout_terms.sample(2).join(' '),  # Random name of 2 terms
            user: user
        )

        # Build 2 Activities for the Workout
        2.times do 
            workout.activities.build(
                sets: Faker::Number.between(from: 1, to: 5),
                reps: Faker::Number.between(from: 4, to: 15),
                weight: Faker::Number.between(from: 10, to: 100),
                exercise: Exercise.all.sample
            ) 
        end

        # Save the Workout (and associated Activities)
        workout.save!  
    end

    # Schedule a Workout for today
    ScheduledWorkout.create!(
        date: Date.today,
        completed: Faker::Boolean.boolean,
        workout: user.workouts.sample
    )
end
