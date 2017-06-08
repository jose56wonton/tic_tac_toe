



class Player
  attr_accessor :name
  def initialize name
    @name = name
  end

end


class Board
  attr_accessor :board
  def initialize
    @board = ["-","-","-","-","-","-","-","-","-"]
  end
  def move player, position
    if(player == 1)
      @board[position] = "X"
    else
      @board[position] = "O"
    end

  end
  def print_board
    for i in 0..8

      if i%3 ==2
        puts "#{@board[i]} "
      else
        print "#{@board[i]} "
      end

    end
  end
  def victory
        #Horizontal
    if (@board[0] == @board[1]) && (@board[1] == @board[2]) && (@board[0]!="-")
      return @board[0]
    elsif (@board[3] == @board[4]) && (@board[4] == @board[5]) && (@board[3]!="-")
      return @board[3]
    elsif @board[6] == @board[7] && @board[7] == @board[8] && (@board[6]!="-")
      return @board[6]
        #Veritical
    elsif @board[0] == @board[3] && (@board[3] == @board[6]) && (@board[0]!="-")
      return @board[0]
    elsif (@board[1] == @board[4]) && (@board[4] == @board[7]) && (@board[1]!="-")
      return @board[1]
    elsif (@board[2] == @board[5]) && (@board[5] == @board[8]) && (@board[2]!="-")
      return @board[2]
        #Diagonal
    elsif (@board[0] == @board[4]) && (@board[4] == @board[8]) && (@board[0]!="-")
      return @board[0]
    elsif (@board[6] == @board[4]) && (@board[4] == @board[2]) && (@board[6]!="-")
      return @board[6]
    else
      return -1
    end
  end
end


class Game

  attr_accessor :board, :player_one, :player_two

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
