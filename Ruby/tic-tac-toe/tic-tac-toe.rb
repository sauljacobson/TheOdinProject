require 'colorize' 

class Player
  attr_accessor :mark 

  def initialize(mark)
    @mark = mark 
  end

  def place_mark(board)
    while true 
      print "Enter position: "
      cell = gets.chomp.to_i
      
      if cell < 0 or cell > 8
        next
      end

      if (board.cell_filled?(cell)) 
        puts "Cell already filled!" 
        next
      end

      board.grid[cell] = @mark 
      break
      
    end
  end
end 

class Board 
  attr_accessor :grid 

  def initialize()
    @grid = ['0', '1', '2', '3', '4', '5', '6', '7', '8']
  end

  def won?()
    horizontal_match? or vertical_match? or diagonal_match?   
  end
  
  def horizontal_match?()
    (@grid[0] == @grid[1] and @grid[1] == @grid[2]) or
    (@grid[3] == @grid[4] and @grid[4] == @grid[5]) or 
    (@grid[6] == @grid[7] and @grid[7] == @grid[8]) 
  end

  def vertical_match?() 
    (@grid[0] == @grid[3] and @grid[3] == @grid[6]) or
    (@grid[1] == @grid[4] and @grid[4] == @grid[7]) or 
    (@grid[2] == @grid[5] and @grid[5] == @grid[8]) 
  end 
  
  def diagonal_match?() 
    (@grid[0] == @grid[4] and @grid[4] == @grid[8]) or
    (@grid[2] == @grid[4] and @grid[4] == @grid[6])  
  end 

  def all_filled?() 
    for cell in @grid
      if cell != 'X' and cell != 'O'
        return false
      end
    end
    return true
  end

  def cell_filled?(pos)
    @grid[pos] == 'X' or @grid[pos] == 'O'
  end 

  def display() 
    puts "-" * 15
    for cell in 0...@grid.size
      print "| #{@grid[cell]} |" 
      if (cell + 1) % 3 == 0
        puts
      end
    end
    puts "-" * 15
  end 
end 

class TicTacToe
  attr_accessor :board

  def initialize()
    @board = Board.new 
  end

  def run()
    player1 = Player.new('X')
    player2 = Player.new('O') 
    turn = 'X' 

    while true
      @board.display;
      puts "Current Turn: #{turn}" 
      if player1.mark == turn 
        player1.place_mark(@board) 
      else
        player2.place_mark(@board)
      end 
      
      if @board.won? 
        @board.display; 
        puts "Player #{turn}! wins!"  
        break
      end

      if @board.all_filled?
        @board.display;
        puts "Draw! No one wins!" 
        break 
      end

      turn = (turn == 'X' ? 'O' : 'X')
    end 
  end
end


game = TicTacToe.new 
game.run()

