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
