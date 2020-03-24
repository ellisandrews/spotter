class Exercise < ApplicationRecord
    # Associations
    has_many :activities

    # Validations
    validates_presence_of :name

end
