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
            when "d"
                delete_operation
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
                affiliation = gets.chomp.downcase.strip
                
                case affiliation
                    when "d"
                        affiliation = "Democrat"
                    when "r"
                        affiliation = "Republican"
                    else 
                        puts "Oops! We don't support that"
                end
          
                @records.create_politician(name.split.map(&:capitalize).join(' '), affiliation.split.map(&:capitalize).join(' '))
            when "v" 
                puts "Name?"
                name = gets.chomp.downcase.strip
                puts "Politics?"
                puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
                affiliation = gets.chomp.downcase.strip
            
            case affiliation
                    when "l"
                        affiliation = "Liberal"
                    when "c"
                        affiliation = "Conservative"
                    when "t"
                        affiliation = "Tea Party"
                    when "s"
                        affiliation = "Socialist"
                    when "n"
                        affiliation = "Neutral"
                    else 
                        puts "Oops! We don't support that"
                end
            
                @records.create_voter(name.split.map(&:capitalize).join(' '), affiliation.split.map(&:capitalize).join(' '))
            else
                puts "Oops! We don't support that"  
        end
    end
    
    def update_operation
        puts "Who would you like to update?"
        name_old = gets.chomp.downcase.strip
        upper_name_old = name_old.split.map(&:capitalize).join(' ')
        
        # Check if politician exists in records
        index_for_politician = @records.search_politician(upper_name_old)
        if index_for_politician
            puts "New name?"
            name_new = gets.chomp.downcase.strip
            upper_name_new = name_new.split.map(&:capitalize).join(' ')
            puts "New party affilitaion?"
            puts "(D)emocrat or (R)epublican"
            affiliation_new = gets.chomp.downcase.strip
            
            case affiliation_new
                when "d"
                    affiliation_new = "Democrat"
                when "r"
                    affiliation_new = "Republican"
                else 
                    puts "Oops! We don't support that"
            end
            
            @records.update_politician(upper_name_old, upper_name_new, affiliation_new)
            puts "Successfully updated politician #{upper_name_new}"
            
            return
        end
        
        # Policitian doesn't exist, so check if voter exists in records
        index_for_voter = @records.search_voter(name_old.split.map(&:capitalize).join(' '))
        if index_for_voter
            puts "New name?"
            name_new = gets.chomp.downcase.strip
            upper_name_new = name_new.split.map(&:capitalize).join(' ')
            puts "New political affilitaion?"
            puts "(L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
            affiliation_new = gets.chomp.downcase.strip
            
            case affiliation_new
                    when "l"
                        affiliation_new = "Liberal"
                    when "c"
                        affiliation_new = "Conservative"
                    when "t"
                        affiliation_new = "Tea Party"
                    when "s"
                        affiliation_new = "Socialist"
                    when "n"
                        affiliation_new = "Neutral"
                    else 
                        puts "Oops! We don't support that"
                end
            
            @records.update_voter(upper_name_old, upper_name_new, affiliation_new)
            puts "Successfully updated voter #{upper_name_new}"
            
            return
        end
        
        # No such records, display user message.
        puts "#{name_old} not found in our records."
    end
    
    def delete_operation
        puts "Who would you like to delete?"
        name = gets.chomp.downcase.strip
        upper_name = name.split.map(&:capitalize).join(' ')
     
        index_for_politician = @records.search_politician(upper_name)
     
        if index_for_politician
            @records.delete_politician(upper_name)
            puts "Successfully deleted politician #{upper_name}"
            return
        end
        
        index_for_voter = @records.search_voter(upper_name)
        if index_for_voter
            @records.delete_voter(upper_name)
            puts "Successfully deleted politician #{upper_name}"
            
            return
            elsif puts "Oops! We don't support that"
        end
    end
end

main = Main.new
main.display_welcome
while true
    if main.display_menu == "q"
        puts "Thank you for using the Voter Simulator. Havew a great day!"
        break
    end
end


