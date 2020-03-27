class User < ApplicationRecord
    # Associations
    has_many :workouts
    has_many :scheduled_workouts, through: :workouts

    # Validations
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }

    # Auth
    has_secure_password

    # Callbacks
    before_validation :normalize_name

    def normalize_name
        self.first_name = first_name.downcase.titleize
        self.last_name = last_name.downcase.titleize
    end

    def full_name
        "#{first_name} #{last_name}"
    end
    
    def favorite_exercise
        query = %q(
            SELECT e.id, 
                   COUNT(*) AS records
            FROM scheduled_workouts sw
            JOIN workouts w ON w.id = sw.workout_id 
            JOIN activities a ON a.workout_id = w.id
            JOIN exercises e ON e.id = a.exercise_id
            WHERE w.user_id = 1
            GROUP BY 1
            ORDER BY 2 DESC
            LIMIT 1;
        )
        results = ActiveRecord::Base.connection.execute(query)
        if results.any?
            Exercise.find(results.first['id'])
        end
    end

    def favorite_muscle

    end
end
