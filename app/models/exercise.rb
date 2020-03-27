class Exercise < ApplicationRecord
    # Associations
    has_many :activities
    has_many :muscle_exercises
    has_many :muscles, through: :muscle_exercises

    # Validations
    validates :name, { presence: true, uniqueness: true }
    validate :has_at_least_one_muscle

    # Callbacks
    before_validation :normalize_name

    def normalize_name
        if self.name
            self.name = self.name.downcase.titleize
        end
    end

    def has_at_least_one_muscle
        errors.add(:muscles, "must have at least one mapped muscle") if muscles.size < 1
    end
end
