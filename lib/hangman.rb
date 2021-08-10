require_relative 'game.rb'
require_relative 'dictionary.rb'
require 'json'

dictionary = Dictionary.new
game = Game.new

word = dictionary.set_word
game.welcome_dialogue
game.play_game(word)



    







