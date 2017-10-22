require './voter.rb'

class Records 
    attr_accessor :voters
    attr_accessor :politicians
    
    def initialize 
        @voters = []
        @politicians = []
    end
    
    def create_voter(name, political_affiliation) 
        voter = Voter.new(name, political_affiliation)
        @voters.push(voter)
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
    
    def search_politician(name)
        index = @politicians.index{ |politician| politician.name == name }
    end
    
    def update_voter(old_name, new_name, new_political_affiliation)
        index_for_voter = search_voter(old_name)
 
        unless index_for_voter == nil
            @voters[index_for_voter].name = new_name
            @voters[index_for_voter].political_affiliation = new_political_affiliation
        end
    end
    
    def update_politician(old_name, new_name, new_party_affiliation)
        index_for_politician = search_politician(old_name)
 
        unless index_for_politician == nil
            @politicians[index_for_politician].name = new_name
            @politicians[index_for_politician].party_affiliation = new_party_affiliation
        end
    end
        
    def delete_voter(name)
        index_for_voter = search_voter(name)
        
        unless index_for_voter == nil 
            @voters.delete_at(index_for_voter)
        end
    end
    
    def delete_politician(name)
        index_for_politician = search_politician(name)
        
        unless index_for_politician == nil
            @politicians.delete_at(index_for_politician)
        end
    end
end
