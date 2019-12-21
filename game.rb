class Game
  require_relative 'player'
  require_relative 'board'
  require_relative 'computer'

  attr_reader :winner

  def initialize
    puts 'What is your name?'
    @player_name = gets.chomp
    puts
    puts '=======The Board========='
    puts
    @players = [Player.new(@player_name, 'X'), Computer.new('Ash2.0', 'O')]
    @board = Board.new
  end

  def play_round
    @players.each do |player|
      puts "%%%%%%#{player.name}'s Turn%%%%%%%%"
      puts
      loop do
        player.make_move
        break if @board.valid_move?(player.move)
      end
      puts '=======The Board========='
      puts
      @board.place_piece(player.move, player.piece)
      puts @board.board

      @winner = player.name if winner?(player.move)
    end
  end

  def winner?(move)
    @board.three_in_row?(move)
  end

  def end_game
    puts "#{@winner} won!!"
  end

  def board
    @board.board
  end
end
