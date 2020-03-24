class Workout < ApplicationRecord
    # Associations
    has_many :user_workouts
    has_many :workout_activities
    has_many :users, through: :user_workouts
    has_many :activities, through: :workout_activities

    # Create an activities_attributes= method for nested form. Don't process activites left completely blank
    accepts_nested_attributes_for :activities, allow_destroy: true, reject_if: :all_blank

    # Validations
    validates :name, presence: true
    validate :has_at_least_one_activity

    # validates_associated :activities

    def has_at_least_one_activity
      errors.add(:activities, "must have at least one activity") if activities.size < 1
    end

end

