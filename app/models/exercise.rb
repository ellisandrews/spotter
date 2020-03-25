class Exercise < ApplicationRecord
    # Associations
    has_many :activities
    has_many :muscle_exercises

    # Validations
    validates_presence_of :name
end
