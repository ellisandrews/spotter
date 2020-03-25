class Activity < ApplicationRecord
  belongs_to :exercise
  belongs_to :workout
end
