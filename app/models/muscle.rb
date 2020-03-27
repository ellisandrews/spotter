class Muscle < ApplicationRecord
    # Associations
    has_many :muscle_exercises
    has_many :exercises, through: :muscle_exercises

    # Validations
    validates_presence_of :name

    # Callbacks
    before_save :normalize_name

    def normalize_name
        self.name = name.downcase.titleize
    end
    
end
