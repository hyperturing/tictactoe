# Player class - Being playing our tic-tac-toe game
###################################################################
# Constructor Parameters:
# Player name (string), Tic-Tac-Toe Piece Icon (string)
##########
# Fields:
# Move: 2-D Array storing row, column coordinates of move
# Name: Name of the player
# Piece: String storing the Tic-Tac-Toe Piece icon of the player
###################################################################
class Player
  attr_reader :move, :piece, :name

  def initialize(name, piece)
    @name = name
    @piece = piece
  end

  def make_move
    puts 'Make your move: '
    @move = gets.chomp.split(' ').map{ |element| element.to_i - 1}
  end
end
