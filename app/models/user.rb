class User < ApplicationRecord
    # Associations
    has_many :user_workouts
    has_many :workouts, through: :user_workouts

    # Auth
    has_secure_password

end
