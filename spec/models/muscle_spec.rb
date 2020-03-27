require "rails_helper"


RSpec.describe Muscle do

    it "must have a name" do    
        muscle = Muscle.new
        expect(muscle).to_not be_valid
    end

    it "normalizes the name before saving" do
        muscle = Muscle.create(name: 'biceps')
        expect(muscle.name).to eq('Biceps')
    end

end
