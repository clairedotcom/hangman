require_relative 'game.rb'
require 'json'

game = Game.new
game.welcome_dialogue

answer = gets.chomp.downcase
if answer == "y"
    file_contents = File.open("lib/game.json","r"){|file| file.read}
    puts "Game loaded."
    puts game.hash_to_game(JSON.parse(file_contents))
    game.reset_game  
    puts "Your guess is #{game.guess.join} and you have #{game.count} guesses left." 
else
    game.game_instructions
end    

until game.game_over? do 
    if game.save_game
        File.write("lib/game.json", game.to_hash.to_json)
        puts "game saved."
        break
    end

    game.turn
end

   





    







