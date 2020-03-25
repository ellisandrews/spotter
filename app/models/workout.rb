class Workout < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :activities
  has_many :schedule_items
  has_many :exercises, through: :activities

  # Validations
  
end
