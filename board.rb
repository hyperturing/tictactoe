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
  attr_reader :board
  require 'matrix'
  WIDTH = 3
  HEIGHT = 3

  def initialize
    @board = Array.new(Board::HEIGHT) { Array.new(Board::WIDTH) { 0 } }
  end

  def valid_move?(move)
    @board[move[0]][move[1]].zero?
  end

  def three_in_row?(move)
    # returns true if there are 3 pieces in-line
    # Check row, column, and optional diagonal of move:
    @matrix = Matrix.rows(@board)
    @rotated = Matrix.rows(@board.reverse)
    @matrix.row(move[0]).sum.abs == 3 || @matrix.column(move[1]).sum.abs == 3 || @matrix.trace.abs == 3 || @rotated.trace.abs == 3 
  end

  def place_piece(move, piece)
    @board[move[0]][move[1]] = piece == 'X' ? 1 : -1
  end

  def display_board
    @output = @board.map { |row| row.map { |element| icon(element) } }
    puts @output.map { |element|
      element.join(' ')
    }
  end

  private

  def icon(value)
    case value
    when 1
      ' X '
    when -1
      ' O '
    when 0
      '   '
    end
  end

  def rotate
    @rotated = []
    @board.transpose.each do |row|
      @rotated << row.reverse
    end
    @rotated
  end
end

