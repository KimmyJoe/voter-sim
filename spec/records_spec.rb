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
    
    it "can list all voters and politicians on record" do
        politician = Politician.new("Jane Doe", "Republican")
        voter = Voter.new("John Doe", "Liberal")
        
        records = Records.new
        records.politicians.push(politician)
        records.voters.push(voter)
        
        expected_result = "Politician, #{politician.name}, #{politician.party_affiliation}\n"
        expected_result += "Voter, #{voter.name}, #{voter.political_affiliation}\n"
        
        expect(records.list).to eq(expected_result)
    end
    
    it "can search for a voter by name" do
        voter_1 = Voter.new("John Doe", "Liberal")
        voter_2 = Voter.new("Dick Dickerson", "Tea Party")
        
        records = Records.new
        records.voters.push(voter_1)
        records.voters.push(voter_2)
        
        index_for_voter = records.search_voter("Dick Dickerson")
        index_for_nonexisting_voter = records.search_voter("Jamie Fox")
        
        expect(index_for_voter).to eq(1)
        expect(index_for_nonexisting_voter).to eq(nil)
    end
    
    it "can search for a politician by name" do
        politician_1 = Politician.new("Jane Doe", "Republican")
        politician_2 = Politician.new("Oliver Jones", "Democrat")
        
        records = Records.new
        records.politicians.push(politician_1)
        records.politicians.push(politician_2)        
        
        index_for_politician = records.search_politician("Oliver Jones")
        index_for_nonexisting_politician = records.search_politician("Jamie Fox")
        
        expect(index_for_politician).to eq(1)
        expect(index_for_nonexisting_politician).to eq(nil)
    end
    
    it "can update a voter" do
        voter_1 = Voter.new("John Doe", "Liberal")
        voter_2 = Voter.new("Dick Dickerson", "Tea Party")
        
        records = Records.new
        records.voters.push(voter_1)
        records.voters.push(voter_2)
        
        records.update_voter("Dick Dickerson", "Dick Anderson", "Socialist")
        
        expect(records.voters[1].name).to eq("Dick Anderson")
        expect(records.voters[1].political_affiliation).to eq("Socialist")
    end
    
    it "can update a politician" do
        politician_1 = Politician.new("Jane Doe", "Republican")
        politician_2 = Politician.new("Oliver James", "Democrat")
        
        records = Records.new
        records.politicians.push(politician_1)
        records.politicians.push(politician_2)
        
        records.update_politician("Oliver James", "Olly Jolly", "Republican")
        
        expect(records.politicians[1].name).to eq("Olly Jolly")
        expect(records.politicians[1].party_affiliation).to eq("Republican")
    end
    it "can delete voters" do
        voter_1 = Voter.new("John Doe", "Liberal")
        voter_2 = Voter.new("Dick Dickerson", "Tea Party")
        
        records = Records.new
        records.voters.push(voter_1)
        records.voters.push(voter_2)
        
        # If deleting existing voter, array count should be 1 less.
        # The search method should also return nil
        
        expect(records.voters.count).to eq(2)
        
        records.delete_voter("Dick Dickerson")
        
        expect(records.voters.count).to eq(1)
        expect(records.search_voter("Dick Dickerson")).to eq(nil)
    end
    it "can delete politicians"       
end
