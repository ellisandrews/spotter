class User < ApplicationRecord
    # Associations
    has_many :workouts

    # Validations
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }

    # Auth
    has_secure_password
end
