require_relative "lib/tic_tac_toe.rb"

puts "Welcome to Tic_Tac_Toe"
puts "Enter the name of the first player"
player1 = gets.chomp
puts "Enter the name of the second player"
player2 = gets.chomp
again = true
loop do
  current_game = Games.new(player1,player2)
  again = current_game.start

  break if !again
end
