class Exercise < ApplicationRecord
    # Associations
    has_many :activities
    has_many :muscle_exercises

    # Validations
    validates_presence_of :name

    # Callbacks
    before_validation :normalize_name

    def normalize_name
        self.name = name.downcase.titleize
    end
    
end
