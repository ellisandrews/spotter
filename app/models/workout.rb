class Workout < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :activities
  has_many :scheduled_workouts
  has_many :exercises, through: :activities

  # Create an activities_attributes= method for nested form. Don't process activites left completely blank
  accepts_nested_attributes_for :activities, allow_destroy: true, reject_if: :all_blank

  # Validations
  validates :name, presence: true
  validate :has_at_least_one_activity

  def has_at_least_one_activity
    errors.add(:activities, "must have at least one mapped activity") if activities.size < 1
  end
end
