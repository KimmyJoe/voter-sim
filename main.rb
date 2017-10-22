require './records.rb'

class Main
    def initialize
        @records = Records.new
    end

    # Methods for main menu
    def display_welcome
        puts "Welcome! This Voter-Simulation will allow you to create voters and politicians."
        puts "Once you have created voters and politicians, you will be given the option to display all created characters."
        puts "You will also have the option to modify or delete each voter or politician after searching for them by name." 
    end 
    
    def display_menu
        puts "What would you like to create?"
        puts "(C)reate, (L)ist, (U)pdate, or (D)elete"
        desired_operation = gets.chomp.downcase.strip

        case desired_operation
            when "c"
                create_operation

            else
                puts "Oops! We don't support that"
        end       
    end

    def create_operation
        puts "What would you like to create?"
        puts "(P)olitician or (V)oter"
        user_input = gets.chomp.downcase.strip

        case user_input
            when "p"
                puts "Name?"
                name = gets.chomp.downcase.strip
                puts "Party?"
                puts "(D)emocrat or (R)epublican"
                affilitaion = gets.chomp.downcase.strip
                @records.create_politician(name, affilitaion)
            when "v"
                puts "Name?"
                name = gets.chomp.downcase.strip
                puts "Politics?"
                puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
                affilitaion = gets.chomp.downcase.strip
                @records.create_voter(name, affilitaion)
            else
                puts "Oops! We don't support that"  
        end
    end
end

main = Main.new
main.display_welcome
main.display_menu


