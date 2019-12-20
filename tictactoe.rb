# frozen_string_literal: true

require_relative 'game'

# High-level game code below
puts 'Welcome to Tic-Tac-Toe!!'
puts 'Instructions:'
puts '========================'
puts 'To make a move when prompted:'
puts 'Enter the row and column numbers of your move separated by a space'
game = Game.new
puts game.board

until game.winner do game.play_round end

game.end_game
