

require "./board.rb"
require "./player.rb"


class Game

  attr_accessor :board

  def initialize player_one, player_two
    @player_one = Player.new(player_one)
    @player_two = Player.new(player_two)
    @board = Board.new
  end


  def start
    @board = Board.new
    current_player = 1+rand(2) == 1 ? @player_one : @player_two
    puts "#{current_player.name} will go first!"



    loop do
      puts "Enter your move location #{current_player.name} (1 through 9)"
      current_move = (gets.chomp.to_i)-1
      if current_player == @player_one
        @board.move(1,current_move)
      else
        @board.move(2,current_move)
      end
      @board.print_board
      current_player = current_player == @player_one ? @player_two : @player_one

      break if @board.victory!=-1
    end

    if @board.victory == "O"
      puts "#{@player_two.name} won the game!"
    else
      puts "#{@player_one.name} won the game!"
    end

    puts "Want to play again(y/n)?"
    if gets.chomp == "y"
      return true
    else
      return false
    end


  end


end
