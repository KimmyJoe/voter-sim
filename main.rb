require './records.rb'

# Variables for main menu
records = Records.new

# Methods for main menu
def display_welcome
    puts "Welcome! This Voter-Simulation will allow you to create voters and politicians."
    puts "Once you have created voters and politicians, you will be given the option to display all created characters."
    puts "You will also have the option to modify or delete each voter or politician after searching for them by name." 
end 

def create_operation
    puts "What would you like to create?"
    puts "(P)olitician or (V)oter"
    user_input = gets.chomp.downcase.strip
end

def main_menu
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

# Main menu
display_welcome

main_menu

