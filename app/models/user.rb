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
    
end
