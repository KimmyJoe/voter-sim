require './politician.rb'

describe Politician do
    it "can create a politician with a name and a party affiliation" do
        politician = Politician.new("John Doe", "Republican")
        expect(politician).to be_a(Politician)
    end
    
    it "can report its name" do
        politician = Politician.new("John Doe", "Republican")
        expect(politician.name).to eq("John Doe")
    end
    
    it "can report its part affiliation"
    
end 
