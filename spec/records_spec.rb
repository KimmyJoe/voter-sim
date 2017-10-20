require './records.rb'
require './voter.rb'
require './politician.rb'

describe Records do
    it "can add a voter to a voters array"  do
        voter = Voter.new("John Doe", "Liberal")
        
        records = Records.new
        records.voters.push(voter)
        
        expect(records.voters.last.name).to eq("John Doe")
        expect(records.voters.last.political_affiliation).to eq("Liberal")
    end
    
    it "can add a politician to a politicians array" do
        politician = Politician.new("Jane Doe", "Republican")
        
        records = Records.new
        records.politicians.push(politician)
        
        expect(records.politicians.last.name).to eq("Jane Doe")
        expect(records.politicians.last.party_affiliation).to eq("Republican")
    end
    
    it "can list all voters and politicians on record"
    it "can search for a voter by name"
    it "can search for a politician by name"
    it "can update a voter"
    it "can update a politician"
    it "can delete voters"
    it "can delete politicians"       
end
