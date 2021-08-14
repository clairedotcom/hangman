class Game
    attr_reader :letters_guessed,:word,:guess,:count,:save_game
    
    def initialize
        @letters_guessed = Array.new
        @word = set_word
        @guess = Array.new(@word.length,"-")
        @count = 12
        @save_game = false
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
        @save_game = false
        user_input = solicit_guess

        if user_input == "save"
            @save_game = true
        end    

        @letters_guessed.push(user_input)

        if @word.include? user_input        
            @word.each_with_index do |letter,position|
                if letter.downcase == user_input
                    @guess[position] = letter
                end
            end        
        end

        @count -= 1

        puts "You have already guessed: #{@letters_guessed.join}"
        puts "You have #{12-@letters_guessed.length} guesses remaining."
        puts @guess.join
    end    

    def game_over?
        if @count == 0
            puts "You're out of guesses. You lose!"
            puts "The word was #{@word.join}."
            true
        elsif @guess == @word
            puts "You win!!" 
            true
        end
    end
    
    def to_hash
        {:letters_guessed => @letters_guessed,
        :word => @word,
        :guess => @guess,
        :count => @count,
        :save_game => @save_game
        }
    end

    def hash_to_game(hash)
        @letters_guessed = hash["letters_guessed"]
        @word = hash["word"]
        @guess = hash["guess"]
        @count = hash["count"]
        @save_game = hash["save_game"]
    end    


end
