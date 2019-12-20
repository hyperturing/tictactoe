# COMPUTER Player class - Machine playing against the player
##################################################################
# Constructor Parameters:
# Computer name (string), Tic-Tac-Toe piece Icon (string)
##########
# Fields:
# Move: 2-D Array storing row, column coordinates of move
# Name: Name of the player
# Piece: String storing the Tic-Tac-Toe piece icon of the player
##########
# Note: This basic computer player does not have AI, it moves randomly
# Future improvement: Add AI to computer player
#######################################################################
class Computer < Player
  def make_move
    @move = [rand(Board::HEIGHT - 1) + 1, rand(Board::WIDTH - 1) + 1]
  end
end
