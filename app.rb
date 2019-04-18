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
# my_game.board.board_show
puts "on va voir qui commence !"
osef = gets.chomp
my_game.who_begins?
while my_game.board.is_still_ongoing? != true
my_game.play_turn
end



# my_game.board.change_value(0,"x")
# my_game.board.change_value(1,"x")
# my_game.board.change_value(2,"x")
# my_game.board.change_value(3,"4")
# my_game.board.change_value(4,"5")
# my_game.board.change_value(5,"6")
# my_game.board.change_value(6,"x")
# my_game.board.change_value(7,"o")
# my_game.board.change_value(8,"o")

binding.pry
