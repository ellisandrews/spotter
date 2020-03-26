require 'set'


# Create my User
User.create!(
    first_name: 'Ellis',
    last_name: 'Andrews',
    email: 'ellis@spotter.com',
    password: 'pw'
)

# Create fake Users
4.times do
    User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: Faker::Internet.password
    )
end

# Create Exercises and Muscles
exercises = [
    {
        'name' => 'Bench Press',
        'description' => 'Lay flat on your back on a bench, and push a bar away from your chest.', 
        'muscles' => ['Pectorals', 'Triceps', 'Deltoids']
    },
    {   
        'name' => 'Dumbbell Fly',
        'description' => 'Lay flat on your back on a bench, and raise dumbbells in each hand until they meet above the center of your chest.',
        'muscles' => ['Pectorals']
    },
    {
        'name' => 'Barbell Overhead Press',
        'description' => 'Stand and raise a barbell over your head.',
        'muscles' => ['Deltoids', 'Trapezius']
    },
    {
        'name' => 'Dumbbell Curl',
        'description' => 'Bend at the elbow to raise dumbbells in each hand from down at your sides up to your shoulders.',
        'muscles' => ['Biceps']
    },
    {
        'name' => 'EZ Bar Curl',
        'description' => 'Bend at the elbow to raise an EZ Bar from down by your waist up to your shoulders.',
        'muscles' => ['Biceps']
    },
    {
        'name' => 'Seated Row',
        'description' => 'Sit on a bench in front of the row machine and pull weight with both hands from directly in front of you towards your stomach.',
        'muscles' => ['Latissimus Dorsi', 'Biceps']
    },
    {
        'name' => 'Triceps Extension',
        'description' => 'Grab triceps machine handles in each hand and push weight away from your body, bending at the elbow.',
        'muscles' => ['Triceps']
    },
    {
        'name' => 'Squat',
        'description' => 'Put the bar on your shoulders behind your head and bend at the knee to lower yourself down and back up.',
        'muscles' => ['Quadriceps', 'Glutes']
    },
    {
        'name' => 'Deadlift',
        'description' => 'Stand slightly bent at the knee and raise bar off the floor in front of you by straightening your knees.',
        'muscles' => ['Hamstrings', 'Glutes']
    },
    {
        'name' => 'Calf Raise',
        'description' => 'Hold weight in each hand will going up on your tip toes and back down.',
        'muscles' => ['Calves']
    }
]

exercises.each do |exercise|

    # Initialize a new exercise
    new_exercise = Exercise.new(
        name: exercise['name'], 
        description: exercise['description']
    )

    # Associate Muscles, creating them if they don't already exist
    exercise['muscles'].each do |muscle_name|

        found_muscle = Muscle.find_by(name: muscle_name)

        if found_muscle
            new_exercise.muscles << found_muscle
        else
            new_exercise.muscles.build(name: muscle_name)
        end
    end

    # Save the exercise
    new_exercise.save!
end

# Create some Workouts/Activities/ScheduledWorkouts for each User

$taken_workout_names = Set.new
$workout_terms = ['Muscle', 'Ripper', 'Shred', 'Bulk', 'Juice', 'Power', 'Body', 'Mass']

def new_workout_name()
    while true
        name = $workout_terms.sample(2).join(' ')  # Random name of 2 terms
        if !$taken_workout_names.include? name
            $taken_workout_names << name
            return name
        end
    end
end

User.all.each do |user|
    
    # Make 2 Workouts
    2.times do

        # Initialize a new Workout for the User
        workout = Workout.new(
            name: new_workout_name,
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
