class User < ApplicationRecord
    # Associations
    has_many :workouts
    has_many :scheduled_workouts, through: :workouts

    # Validations
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :username, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validate :has_unique_slug

    # Auth
    has_secure_password

    # Callbacks
    before_validation :normalize_name, :slugify_username

    def has_unique_slug
        if User.exists? slug: slug
            errors.add :username, 'has already been taken'
        end
    end

    def slugify_username
        self.slug = username.parameterize
    end

    def normalize_name
        self.first_name = first_name.downcase.titleize
        self.last_name = last_name.downcase.titleize
    end

    def full_name
        "#{first_name} #{last_name}"
    end
    
    def favorite_exercise
        query = %{
            SELECT e.id, 
                   COUNT(*) AS records
            FROM scheduled_workouts sw
            JOIN workouts w ON w.id = sw.workout_id 
            JOIN activities a ON a.workout_id = w.id
            JOIN exercises e ON e.id = a.exercise_id
            WHERE w.user_id = #{self.id}
            GROUP BY 1
            ORDER BY 2 DESC
            LIMIT 1;
        }     
        results = ActiveRecord::Base.connection.execute(query)
        if results.any?
            Exercise.find(results.first['id'])
        end
    end

    def favorite_muscle
        query = %{
            SELECT m.id, 
                   COUNT(*) AS count
            FROM scheduled_workouts sw
            JOIN workouts w ON w.id = sw.workout_id 
            JOIN activities a ON a.workout_id = w.id
            JOIN exercises e ON e.id = a.exercise_id
            JOIN muscle_exercises me ON me.exercise_id = e.id
            JOIN muscles m ON m.id = me.muscle_id
            WHERE w.user_id = #{self.id}
            GROUP BY 1
            ORDER BY 2 DESC
            LIMIT 1;
        }
        results = ActiveRecord::Base.connection.execute(query)
        if results.any?
            Muscle.find(results.first['id'])
        end
    end

end
