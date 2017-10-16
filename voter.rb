require './person.rb'

class Voter < Person
    def initialize(name, political_affiliation)
        # Don't create new instance variable, use from parent
        super(name) # calls the constructor of the base class, which is the initialize method.
    end
end
