require './person.rb'

class Politician < Person
    attr_reader :party_affiliation
    
    def initialize(name, party_affiliation)
        super(name)
        @party_affiliation = party_affiliation
    end
    
end
