class Board
  attr_accessor :board, :number_of_mines, :size
  
  def initialize(size = 9, number_of_mines = 5)
    @size = size
    @board = Array.new(size) { |row| Array.new(size) { |col| Tile.new([row, col]) } }
    @number_of_mines = number_of_mines
    mine_positions = random_position_generator(number_of_mines)
    mine_positions.each do |pos|
      @board[pos.first][pos.last].mine = true
    end
  end
  
  def [](row, col)
    @board[row][col]
  end
  
  def random_position_generator (number_of_mines)
    random_positions = []
    until random_positions.count == number_of_mines do
      random_position = [rand(0...board.size), rand(0...board.size)]
      unless random_positions.include?(random_position)
        random_positions << random_position
      end
    end
    random_positions
  end
  
  def display
    title = "   ".concat((0...size).to_a.inject("") { |t, v| t + " #{v%10} " })
    output = [title]
    board.each_with_index do |row, i|
      line = " #{i%10} "
      row.each_with_index do |tile, j|
        if tile.flagged
          line << " F "
        elsif !tile.revealed
          line << " * "
        elsif tile.neighbor_bomb_count(self, [i, j]) > 0
          line << " #{tile.neighbor_bomb_count(self, [i, j]).to_s} "
        else
          line << " _ "
        end
      end
      output << line + "   "
    end
    output      
  end
  
  def won?
    board.flatten.select { |tile| tile.mine }.all? { |tile| tile.flagged }
  end
  
  def exploded?
    board.flatten.any? { |tile| tile.mine && !tile.flagged && tile.revealed }
  end
  
  def find_pos(tile)
    @board.each_with_index do |row, i|
      row.each_with_index do |t, j|
        return [i, j] if t == tile
      end
    end
  end   
  
end

class Tile
  attr_accessor :mine, :flagged, :revealed, :pos
  
  def initialize(pos)
    @mine, @flagged, @revealed = [false] * 3
    @pos = pos
  end

  def reveal(board, visited_tiles = [])
    return if @revealed
    @revealed = true
    bomb_count = neighbor_bomb_count(board, @pos)
    if @mine || bomb_count > 0
      return
    end
    neighbors(board, @pos).each do |neighbor|
      neighbor.reveal(board)
    end
  end

  def swap_flag
    @flagged = !@flagged
  end    
  
  def neighbors(board, current_pos)
    neighbors = []
    possible_neighbors = [
      [current_pos.first + 1, current_pos.last],
      [current_pos.first - 1, current_pos.last],
      [current_pos.first, current_pos.last + 1],
      [current_pos.first, current_pos.last - 1],
      [current_pos.first + 1, current_pos.last + 1],
      [current_pos.first - 1, current_pos.last - 1],
      [current_pos.first + 1, current_pos.last - 1],
      [current_pos.first - 1, current_pos.last + 1] 
    ]
    possible_neighbors.each do |pos|
      neighbors << board[pos[0], pos[1]] if inside_board?(board, pos)
    end
    neighbors
  end

  def neighbor_bomb_count(board, current_pos)
    neighbors(board, current_pos).flatten.select { |neighbor| neighbor.mine }.count
  end
  
  def inside_board?(board, pos)
    pos.first.between?(0, board.size - 1) &&
      pos.last.between?(0, board.size - 1)
  end
  
end

class Game
  attr_accessor :board
  
  def get_input
    print "enter (r)eveal, (f)lag, e(x)it, (s)ave, or (l)oad: "
    move = gets.chomp.downcase.to_sym
    return [nil,move.to_sym] if move == :x || move == :s || move == :l
    print "give x the position you want to choose: "
    posx = gets.chomp.to_i
    print "give y the position you want to choose: "
    posy = gets.chomp.to_i
    pos = [posx, posy]
    [pos, move]
  end
  
  def play
    @board = Board.new
    until board.won? || board.exploded?
      board.display.each { |row| puts row }
      
      pos, move = get_input
      
      if move == :x || move == :s
        puts save_game if move == :s
        break
      end
      
      if move == :l
        @board = load_game
      end
      
      board[pos.first, pos.last].reveal(board, [pos.first, pos.last]) if move == :r
      board[pos.first, pos.last].swap_flag if move == :f
    end
    puts "EXPLODED!!!" if board.exploded?
    puts "CONGRATS!!!" if board.won?
  end
  
  def save_game
    require 'yaml'
    file = File.open("saved_game.yaml", "w")
    file.puts board.to_yaml
    file.close
    return "Game saved."
  end
  
  def load_game
    require 'yaml'
    YAML::load_file("saved_game.yaml")
  end
  
end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end