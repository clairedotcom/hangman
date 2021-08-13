class Game
    def initialize
        @letters_guessed = Array.new
        @word = set_word
        @guess = Array.new(@word.length,"-")
        @count = 12
    end    
    
    def welcome_dialogue
        print "Welcome to hangman!\n"
        print "Would you like to load a saved game?\n"
        print "Enter 'y' or 'n': "
    end

    def game_instructions
        print "You have 12 guesses to guess the secret word.\n"
        print "If you would like to save your game, enter 'save' at any time.\n"
    end     
    
    def solicit_guess
        puts "\nEnter your guess:"
        gets.chomp.downcase
    end

    def set_word
        lines = File.readlines('dictionary.txt')
        dict_length = File.readlines('dictionary.txt').size
        word = ""
    
        until word.length > 5 && word.length < 12 do
            index = rand(1..dict_length)
            word = lines[index].strip.chars
        end
    
        return word.map {|letter| letter.downcase}
    end
    
    def turn
        user_input = solicit_guess
        @letters_guessed.push(user_input)

        if @word.include? user_input        
            @word.each_with_index do |letter,position|
                if letter.downcase == user_input
                    @guess[position] = letter
                end
            end        
        end

        puts "You have already guessed: #{@letters_guessed.join}"
        puts "You have #{@count-@letters_guessed.length} guesses remaining."
        puts @guess.join
    end    

    def game_over?
        if @letters_guessed.length == @count
            puts "You've guessed #{@count} times. You lose!"
            puts "The word was #{@word.join}."
            true
        elsif @guess == @word
            puts "You win!!" 
            true
        end
    end    
end
