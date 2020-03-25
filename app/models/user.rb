class User < ApplicationRecord
    # Associations
    has_many :user_workouts
    has_many :workouts, through: :user_workouts

    # Validations
    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }

    # Auth
    has_secure_password

end
