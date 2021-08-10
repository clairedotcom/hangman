class Game
    def welcome_dialogue
        print "Welcome to hangman!\n"
        print "You have 12 guesses to guess the secret word.\n"
    end

    def play_game(word)
        count = 12
        guess = Array.new(word.length,"-")
        letters_guessed = Array.new

        until guess == word do
            puts "Enter your guess:"
            user_input = gets.chomp.downcase
            letters_guessed.push(user_input)

            if word.include? user_input        
                word.each_with_index do |letter,position|
                    if letter == user_input
                        guess[position] = letter
                    end
                end        
            end
            puts "You have already guessed: #{letters_guessed.join}"
            puts "You have #{count-letters_guessed.length} guesses remaining."

            if letters_guessed.length == count
                puts "You've guessed #{count} times. You lose!"
                break
            end    
            puts guess.join
        end
    end    
end
