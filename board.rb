# Board class - Tic-Tac-Toe Board
###################################################################
# Constructor Parameters: None
# Class constants: Width and Height of our board
##########
# Fields:
# Board: 2-D array representation of the pieces on our board
##########
# Note: # Moves are an 2-element array containing a row and column number
#########################################################################
class Board
  require 'matrix'
  WIDTH = 3
  HEIGHT = 3

  def initialize
    @board = Array.new(Board::HEIGHT) { Array.new(Board::WIDTH) { 0 } }
  end

  def valid_move?(move)
    @board[move[0].to_i][move[1].to_i].zero?
  end

  def three_in_row?(move)
    # returns true if there are 3 pieces in-line
    # Check row, column, and optional diagonal of move:
    @matrix = Matrix.rows(@board)
    @matrix.row(move[0].to_i).sum.abs == 3 || @matrix.row(move[1].to_i).sum.abs == 3 || @matrix.each(:diagonal).sum.abs == 3
  end

  def place_piece(move, piece)
    @board[move[0].to_i][move[1].to_i] = piece == 'X' ? 1 : -1
  end

  def board
    @board
  end
end
