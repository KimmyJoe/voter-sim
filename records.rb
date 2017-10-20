class Records 
    attr_accessor :voters
    attr_accessor :politicians
    
    def initialize 
        @voters = []
        @politicians = []
    end
    
    def list
        results = ""
        
        @politicians.each do |politician|
            results += "Politician, #{politician.name}, #{politician.party_affiliation}\n"
        end
        
        @voters.each do |voter|
            results += "Voter, #{voter.name}, #{voter.political_affiliation}\n"
        end 
        
        return results
    end
    
    def search_voter(name)
        index = @voters.index{ |voter| voter.name == name }
    end
end