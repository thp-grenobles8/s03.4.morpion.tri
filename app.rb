require 'bundler'


$:.unshift File.expand_path("./../lib", __FILE__)
require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/boardcase'
require_relative 'lib/show'
# require 'views/fichier_2'


Bundler.require

my_game = Game.new("Game 1")

my_game.add_player
puts "on va voir qui commence !"
osef = gets.chomp
my_game.who_begins?
count = 1
while my_game.board.is_still_ongoing? != true && count < 10
my_game.play_turn
count +=1
puts "Il reste #{10 - count} tour de jeu maximum"
end


