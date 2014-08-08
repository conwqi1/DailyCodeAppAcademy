class Board
  ALL_LINES = [
    [[0,0],[0,1],[0,2]],
    [[1,0],[1,1],[1,2]],
    [[2,0],[2,1],[2,2]],
    [[0,0],[1,0],[2,0]],
    [[0,1],[1,1],[2,1]],
    [[0,2],[1,2],[2,2]],
    [[0,0],[1,1],[2,2]],
    [[2,0],[1,1],[0,2]]
  ]
  def initialize
    @board = Array.new(3) { Array.new(3) }
    @winner = nil
  end
  
  def printBoard
      @board.each do|element|
        p element
      end
  end
  
  def won?
    
    # iterate over possible winning positions
    # positions == [[0,0], [0,1], [0,2]] 
    ALL_LINES.each do |positions|
      counts = counts_from_line(positions)
      
      counts.keys.each do |mark|
        if counts[mark] == 3
          @winner = mark
          return true
        end
      end
    end
    
    false
  end
  
  def counts_from_line positions
    counts = {
      'x' => 0,
      'o' => 0
    }
    
    positions.each do |pos|
      mark = @board[ pos[0] ][ pos[1] ]
      if !mark.nil?
        counts[mark] += 1
      end
    end
    
    counts
  end
  
  def winner
    if !@winner.nil?
      @winner
    end
  end
  
  def empty?(pos)
    @board[ pos[0] ][ pos[1] ].nil?
  end
  
  def place_mark(pos,mark)
     @board[pos[0]][pos[1]] = mark if empty?(pos)
  end
  
  def dup
    new_board_object = Board.new
    new_board_array = []
    
    @board.each do |row|
      new_board_array << row.dup
    end
    
    new_board_object.board = new_board_array
    
    new_board_object
  end
  
  protected 
  attr_accessor :board
end

class Game
  def initialize players
    @players = players
    @board = Board.new
    
    @players.each do |player|
      player.board = @board
    end
  end
  
  def play
    while !@board.won?
      @players.each do |player|
        player.move if !@board.won?
        @board.printBoard
      end

    end
  end
end

class HumanPlayer
  attr_accessor :board
  
  def move
    puts "choice your position, do input in format 'x,y' "
    position=gets.chomp.split(",").map{|el|el.to_i}
    while (position[0]>2) || (position[1]>2) || (position[0]<0) || (position[1]<0)do
      puts "choice your position again, do input in format 'x,y' "
      position=gets.chomp.split(",").map{|el|el.to_i}
     end
    @board.place_mark(position,"x")
  end

end

class ComputerPlayer
  attr_accessor :board, :mark
  
  def initialize 
    @mark = 'o'
  end
  
  def move
    move1 = winning_move
    if move1
      @board.place_mark(move1,mark)
    else
      make_random_move
    end
  end
  
  def winning_move
    Board::ALL_LINES.each do |line|
      counts = @board.counts_from_line(line)
      position = []
      
      total = 0
      counts.values.each { |val| total += val }
      
      if 2 == counts[mark] && 2 == total
        line.each do |pos|
          position = pos if @board.empty?(pos)
        end
        
        return position
      end
    end
    false
  end
  
  def make_random_move
    position = random_position
    while !@board.empty?(position)
      position = random_position
    end
    @board.place_mark(position, mark)
  end
  
  def random_position
    [rand(0..2), rand(0..2)]
  end
end


if __FILE__ == $PROGRAM_NAME
  human = HumanPlayer.new
  computer = ComputerPlayer.new
  game = Game.new([human, computer])
end