require "rails_helper"


RSpec.describe Exercise do

    it "must have a name" do
        pecs = Muscle.new(name: 'pectorals')
        exercise = Exercise.new(name: nil, muscles: [pecs])
        expect(exercise).to_not be_valid
    end

    it "must have a unique name" do    
        pecs = Muscle.new(name: 'pectorals')
        Exercise.create!(name: 'bench press', muscles: [pecs])
        
        exercise = Exercise.new(name: 'bench press', muscles: [pecs])
        expect(exercise).to_not be_valid
    end
    
    it "normalizes the name before validating" do
        exercise = Exercise.new(name: 'bench press')
        exercise.valid?
        expect(exercise.name).to eq('Bench Press')
    end

    it "must have at least one mapped muscle" do
        exercise = Exercise.new(name: 'bench press')
        expect(exercise).to_not be_valid
    end
    
end
