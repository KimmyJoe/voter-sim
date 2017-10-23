require './records.rb'

describe Records do
    it "can create a voter and add it to a voters array"  do
        records = Records.new
        records.create_voter("John Doe", "Liberal")
        
        expect(records.voters.last.name).to eq("John Doe")
        expect(records.voters.last.political_affiliation).to eq("Liberal")
    end
    
    it "can create a politician and add it to a politicians array" do
        records = Records.new
        records.create_politician("Jane Doe", "Republican")
        
        expect(records.politicians.last.name).to eq("Jane Doe")
        expect(records.politicians.last.party_affiliation).to eq("Republican")
    end
    
    it "can list all voters and politicians on record" do
        records = Records.new

        records.create_politician("Jane Doe", "Republican")
        records.create_voter("John Doe", "Liberal")
        
        expected_result += "Politician, #{records.politicians.last.name}, #{records.politicians.last.party_affiliation}\n"
        expected_result += "Voter, #{records.voters.last.name}, #{records.voters.last.political_affiliation}\n"
        
        expect(records.list).to eq(expected_result)
    end
    
    it "can search for a voter by name" do
        records = Records.new
        records.create_voter("John Doe", "Liberal")
        records.create_voter("Dick Dickerson", "Tea Party")
        
        index_for_voter = records.search_voter("Dick Dickerson")
        index_for_nonexisting_voter = records.search_voter("Jamie Fox")
        
        expect(index_for_voter).to eq(1)
        expect(index_for_nonexisting_voter).to eq(nil)
    end
    
    it "can search for a politician by name" do
        records = Records.new
        records.create_politician("Jane Doe", "Republican")
        records.create_politician("Oliver Jones", "Democrat")
        
        index_for_politician = records.search_politician("Oliver Jones")
        index_for_nonexisting_politician = records.search_politician("Jamie Fox")
        
        expect(index_for_politician).to eq(1)
        expect(index_for_nonexisting_politician).to eq(nil)
    end
    
    it "can update a voter" do
        records = Records.new
        records.create_voter("John Doe", "Liberal")
        records.create_voter("Dick Dickerson", "Tea Party")
        
        records.update_voter("Dick Dickerson", "Dick Anderson", "Socialist")
        
        expect(records.voters[1].name).to eq("Dick Anderson")
        expect(records.voters[1].political_affiliation).to eq("Socialist")
    end
    
    it "can update a politician" do
        records = Records.new
        records.create_politician("Jane Doe", "Republican")
        records.create_politician("Oliver James", "Democrat")
        
        records.update_politician("Oliver James", "Olly Jolly", "Republican")
        
        expect(records.politicians[1].name).to eq("Olly Jolly")
        expect(records.politicians[1].party_affiliation).to eq("Republican")
    end
    it "can delete voters" do
        records = Records.new
        records.create_voter("John Doe", "Liberal")
        records.create_voter("Dick Dickerson", "Tea Party")
        
        # If deleting existing voter, array count should be 1 less.
        # The search method should also return nil
        
        expect(records.voters.count).to eq(2)
        
        records.delete_voter("Dick Dickerson")
        
        expect(records.voters.count).to eq(1)
        expect(records.search_voter("Dick Dickerson")).to eq(nil)
    end
    it "can delete politicians"  do
        records = Records.new
        records.create_politician("Jane Doe", "Republican")
        records.create_politician("Oliver James", "Democrat")
        
        # If deleting existing politicians, array count should be 1 less.
        # The search method should also return nil
        
        expect(records.politicians.count).to eq(2)
        
        records.delete_politician("Oliver James")
        
        expect(records.politicians.count).to eq(1)
        expect(records.search_politician("Oliver James")).to eq(nil)
    end      
end
