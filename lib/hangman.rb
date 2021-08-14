require_relative 'game.rb'
require 'json'

game = Game.new
game.welcome_dialogue

answer = gets.chomp.downcase
if answer == "y"
    saved_game = JSON::load()
end    

game.game_instructions

until game.game_over? do 
    if game.save_game
        puts game.to_json
    end

    game.turn
end

def serialize_game
    filename = gets.chomp
    puts game.to_json
end

   





    







