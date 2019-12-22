# frozen_string_literal: true

require_relative 'game'

# High-level game code below
game = Game.new
puts game.board

until game.winner do game.play_round end

game.end_game
