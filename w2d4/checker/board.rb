#encoding: UTF-8
#require_relative './pieces.rb'

class Board
  
  def initialize(fill_board = true)
    @board = Array.new(8){Array.new(8)}
    set_board if fill_board
  end
  
  def [](pos)
    row, col = pos
    @board[row][col]
  end
  
  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end
  
  def render
    @board.map do |row|
      row.map do |piece|
        piece.to_s
      end
    end
  end
  
  # def render
  #   @rows.map do |row|
  #     row.map do |piece|
  #       piece.nil? ? '_' : piece.render
  #     end.join
  #   end.join('\n')
  # end
  
  def set_board
    red_positions = [[0, 1], [0, 3], [0, 5], [0, 7], [1, 0], [1, 2], [1, 4],
    [1, 6], [2, 1], [2, 3], [2, 5], [2, 7]]

    black_positions = [[6, 1], [6, 3], [6, 5], [6, 7], [5, 0], [5, 2], [5, 4],
    [5, 6], [7, 0], [7, 2], [7, 4], [7, 6]]

    red_positions.each do |red_position|
       @board[red_position[0]][red_position[1]] =
       Piece.new(:red, red_position, self)
    end

    black_positions.each do |black_position|
       @board[black_position[0]][black_position[1]] =
       Piece.new(:black, black_position, self)
    end
  end
  
  def pieces
      @board.flatten.compact
  end
  
  def dup_board
      new_board = Board.new(false)
      pieces.each do |piece|
        piece.class.new(piece.color, new_board, piece.pos)
      end

      p new_board
  end
  
  def move(start_position, end_position)
    self[start_position].perform_moves(end_position)
  end
  
  
end





class Piece

  attr_reader :pos, :board, :king, :color
  attr_writer :pos, :king
  
  def initialize(color, pos, board, king = false)
    @color = color
    @pos = pos
    @board = board
    @king = king
  end
  
  def to_s
   "K" if self.king == true
   "P" if self.king == false
  end
  
  def perform_moves(move_sequence)
    p valid_move_seq?(move_sequence)
    if valid_move_seq?(move_sequence)
      perform_moves!(move_sequence)
    else
      raise "Invalid Move"
    end 
  end

  def perform_moves!(move_sequence)
    if move_sequence.count == 1
        if perform_slide(move_sequence[0])
          move_piece!(move_sequence[0])
        elsif perform_jump(move_sequence[0])
          opponent = [(self.pos[0] + move_sequence[0])/2,
                      (self.pos[1] + move_sequence[1])/2]
           @board[opponent] = nil 
           move_piece!(move_sequence[0])
        else
          raise "Invalid Move"
        end
     else #move_squence.count > 1
        move_sequence.each do |step|
          if perform_slide(step)
             move_piece!(step)
          elsif perform_jump(step) 
            opponent = [(self.pos[0] + step[0])/2,
                        (self.pos[1] + step[1])/2]
            @board[opponent] = nil 
            move_piece!(move_sequence[0])
          else
             raise "Invalid Move"
          end
        end
     end
  end

  def valid_move_seq?(move_sequece)
    begin
      dup_board[self.pos[0]][self.pos[1]].perform_moves!(move_sequence)
    rescue
      true
    else
      false
    end
  end

  def pieces
      @board.flatten.compact
  end

  def dup_board
      new_board = Board.new(false)

      pieces.each do |piece|
        Piece.new(piece.color, piece.pos, new_board, piece.king)
      end

      new_board
  end


  
  def perform_slide(end_position)
    p "end_position is #{end_position}"
    p "valid slides are #{valid_slides}"
    if valid_slides.include?(end_position)
      true
    else
      false
    end
  end
  
  
  def perform_jump(end_position)
    if valid_jumps.include?(end_position)
      true
    else
      false
    end
  end

  def on_board?(pos)
    pos.all?{ |coord| coord.between?(0, 7) }
  end
  
  def valid_slides
    possible_moves = []
    move_diffs.each do |move_diff|
      possible_moves << [self.pos[0] + move_diff[0], pos[1] + move_diff[1]]
    end
    p "possible_moves are #{possible_moves}"
    possible_moves.select do |possible_move|
      on_board?(possible_move) && @board[possible_move].nil?
    end
  end
  
  def valid_jumps
    possible_moves = []
    move_diffs.each do |move_diff|
       neighbors = [self.pos[0] + move_diff[0], self.pos[1] + move_diff[1]]
       if (!@board[neighbors].nil?) && (@board[neighbors].color != self.color)
           possible_moves << [self.pos[0] + (2 * move_diff[0]),
                              self.pos[1] + (2 * move_diff[1])]
       end
    end
    possible_moves.select do |possible_move|
       on_board?(possible_move) && @board[possible_move].nil?
    end
  end
  
  def move_piece!(position)
    @board[self.pos] = nil
    @board[position] = self
    self.pos = position
    maybe_promote
  end
  
  def move_diffs
    down_moves = [[1, 1], [1, -1]]
    up_moves = [[-1, 1], [-1, -1]]
    if self.king == true
      up_moves + down_moves
    elsif self.color == :red
      down_moves
    else
      up_moves
    end
  end
  
  def maybe_promote#check if the piece reached the back row
    at_back_row = ((self.color == :red) && (self.pos[1] == 7)) ||
                  ((self.color == :black) && (self.pos[1] == 0))
    @king = true if at_back_row
  end

end




class NilClass
  def inspect
    '-'
  end
end