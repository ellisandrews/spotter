class Muscle < ApplicationRecord
    # Associations
    has_many :muscle_exercises
    has_many :exercises, through: :muscle_exercises

    # Validations
    validates_presence_of :name

    # Callbacks
    before_validation :normalize_name

    def normalize_name
        if self.name
            self.name = self.name.downcase.titleize
        end
    end
    
end
