class Activity < ApplicationRecord
  # Associations
  belongs_to :exercise
  belongs_to :workout

  # Validations
  validates :sets, { presence: true, numericality: { greater_than: 0 } }
  validates :reps, { presence: true, numericality: { greater_than: 0 } }
  validates :weight, { presence: true, numericality: { greater_than: 0 } }

end
