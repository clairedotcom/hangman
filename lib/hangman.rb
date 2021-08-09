dictionary = 'dictionary.txt'

lines = File.readlines(dictionary)
dict_length = File.readlines(dictionary).size

word = ""

until word.length > 5 && word.length < 12 do
    index = rand(1..dict_length)
    word = lines[index].strip.chars
end

count = 12

puts "Welcome to hangman!"
puts "You have #{count} guesses to guess the secret word."


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

puts "you win!"

    







