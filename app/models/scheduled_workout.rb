class ScheduledWorkout < ApplicationRecord
  # Associations
  belongs_to :workout
  has_one :user, through: :workout

  # Validations
  validates :date, presence: true

  def pretty_date
    date.strftime('%B %-d, %Y (%A)')  # e.g. 'March 25, 2020 (Wednesday)'
  end

  def pretty_completed
    case completed
    when true
      'Yes'
    when false
      'No'
    else
      'N/A'
    end
  end

end
