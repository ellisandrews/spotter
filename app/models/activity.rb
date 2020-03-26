class Activity < ApplicationRecord
  # Associations
  belongs_to :exercise
  belongs_to :workout

  # Validations
  validates :sets, presence: true
  validates :reps, presence: true
  validates :weight, presence: true
end
