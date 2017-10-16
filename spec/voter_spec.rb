require './voter.rb'

describe Voter do
    it "can create voter with a name and political affiliation" do
        voter = Voter.new("John Doe", "Liberal")
        expect(voter).to be_a(Voter)
    end
    
    it "can report its name" do
        voter = Voter.new("John Doe", "Liberal")
        expect(voter.name).to eq("John Doe")
    end
    
    it "can report its political affilitaion"
end 