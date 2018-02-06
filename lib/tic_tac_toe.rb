class TicTacToe
  
  def initialize(board = Array.new(9, " "))
     #set @board to an array with 9 "" empty strings within @board
    @board = board
    @number_of_xs = 0
    @number_of_os = 0 
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], #horizontal lines 
    [0, 3, 6], [1, 4, 7], [2, 5, 8], #vertical lines 
    [0, 4, 8], [2, 4, 6]            #diagonal lines
  ]
  
  def display_board 
    #print current board based on @board
    puts " #{@board[0]}  | #{@board[1]} | #{@board[2]} "
    puts "-------------"
    puts " #{@board[3]}  | #{@board[4]} | #{@board[5]} "
    puts "-------------"
    puts " #{@board[6]}  | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
   
   
  def move(index, token = "X")
    @board[index] == token
  end
  
  
  def position_taken?(index)
    @board[index] != " "
  end
  
  def valid_move?(index)
    index >= 0 && index <= 8 && !position_taken?(index)
  end
  
  def turn
    index = -1
    unless valid_move?(index)
      puts "Please enter 1-9:"
      user_input = gets.chomp!
    end
    move(index, current_player)
    display_board
  end
  
  def turn_count
    turn_num = 0
    @board.each do |space| 
      turn_num += 1 if space != " "
    end
    turn_num
  end
  
  def current_player
    if turn_count % 2 == 0
      token = "X"
    else
      token = "O"
    end
    token
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      combo.each do |num|
        @number_of_xs += 1 if @board[num] == "X"
        @number_of_os += 1 if @board[num] == "O"
      end
    end
    @number_of_xs == 3 || @number_of_os == 3
  end
  
  
  def full?
    !@board.include?(" ")
  end
  
  
  def draw?
    full? && !won?
  end
  
  
  def over?
    won? || full?
  end
  
  def winner
    return "X" if @number_of_xs == 3
    return "O" if @number_of_os == 3
  end
  
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end