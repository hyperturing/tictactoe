class Game
  require_relative 'player'
  require_relative 'board'
  require_relative 'computer'

  attr_reader :winner

  def initialize
    puts 'Welcome to Tic-Tac-Toe!!'

    puts 'What is your name?'
    @player_name = gets.chomp

    puts 'Instructions:'
    puts '========================'
    puts 'To make a move when prompted:'
    puts 'Enter the row and column numbers of your move separated by a space'
    puts
    puts '=======The Board========='
    puts
    @players = [Player.new(@player_name, 'X'), Computer.new('Ash2.0', 'O')]
    @board = Board.new
    @round = 1
  end

  def play_round
    @players.each do |player|
      puts "%%%%%%#{player.name}'s Turn%%%%%%%%"
      puts

      play_turn(player)
      @board.place_piece(player.move, player.piece)
      @winner = player.name if winner?(player.move)
      break if winner

      puts '=======The Board========='
      puts
      puts @board.display_board
    end

    puts
    puts "End of round #{@round}"
    @round += 1
  end

  def play_turn(player)
    loop do
      player.make_move
      break if @board.valid_move?(player.move) || winner
    end
  end

  def winner?(move)
    @board.three_in_row?(move)
  end

  def end_game
    puts "#{@winner} won!!"
  end

  def board
    @board.display_board
  end
end
