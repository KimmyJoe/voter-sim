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
        puts "What would you like to do?"
        puts "(C)reate, (L)ist, (U)pdate, (D)elete or (Q)uit"
        desired_operation = gets.chomp.downcase.strip

        case desired_operation
            when "c"
                create_operation
            when "l"
                puts @records.list
            when "u"
                update_operation
            when "q"
                return desired_operation
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
    
    def update_operation
        puts "Who would you like to update?"
        name_old = gets.chomp.downcase.strip
        
        # Check if politician exists in records
        index_for_politician = @records.search_politician(name_old)
        if index_for_politician
            puts "New name?"
            name_new = gets.chomp.downcase.strip
            puts "New party affilitaion?"
            puts "(D)emocrat or (R)epublican"
            affilitaion_new = gets.chomp.downcase.strip
            @records.update_politician(name_old, name_new, affilitaion_new)
            
            return
        end
        
        # Policitian doesn't exist, so check if voter exists in records
        index_for_voter = @records.search_voter(name_old)
        if index_for_voter
            puts "New name?"
            name_new = gets.chomp.downcase.strip
            puts "New political affiliation?"
            puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
            affilitaion_new = gets.chomp.downcase.strip
            @records.update_voter(name_old, name_new, affilitaion_new)
           
            return
        end
        
        # No such records, display user message.
        puts "#{name_old} not found in our records."
    end
end

main = Main.new
main.display_welcome
while true
    if main.display_menu == "q"
        break
    end
end


