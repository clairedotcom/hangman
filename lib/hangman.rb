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
    game.turn
end



    







