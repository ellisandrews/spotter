require "rails_helper"


RSpec.describe Muscle do

    it "must have a name" do    
        muscle = Muscle.new
        expect(muscle).to_not be_valid
    end

    it "normalizes the name before validating" do
        muscle = Muscle.new(name: 'biceps')
        muscle.valid?
        expect(muscle.name).to eq('Biceps')
    end

end
