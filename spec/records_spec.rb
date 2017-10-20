require './records.rb'
require './voter.rb'

describe Records do
    it "can add a voter to a voters array"  do
        voter = Voter.new("John Doe", "Liberal")
        
        records = Records.new
        records.voters.push(voter)
        
        expect(records.voters.last.name).to eq("John Doe")
        expect(records.voters.last.political_affiliation).to eq("Liberal")
    end
    
    it "can add a politician to a politicians array"
    it "can list all voters and politicians on record"
    it "can search for a voter by name"
    it "can search for a politician by name"
    it "can update a voter"
    it "can update a politician"
    it "can delete voters"
    it "can delete politicians"       
end
