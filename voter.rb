require './person.rb'

class Voter < Person
    attr_reader :political_affiliation
    
    def initialize(name, political_affiliation)
        # Don't create new instance variable, use from parent
        super(name) # calls the constructor of the base class, which is the initialize method.
        @political_affiliation = political_affiliation
    end
end
