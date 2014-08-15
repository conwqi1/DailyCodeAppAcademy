# encoding: UTF-8

require './pieces.rb'

class Board
  
  def initialize(place_pieces = true)
    @board = Array.new(8){Array.new(8)}
    set_board if place_pieces
  end
  
  def [](pos)
    row, col = pos
    @board[row][col]
  end
  
  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end
  
  def set_board
    back_pieces = [Rook, Knight, Bishop, Queen,
                    King, Bishop, Knight, Rook]
    8.times do |i|
       @board[0][i] = back_pieces[i].new([0, i], self, :black)
       @board[7][i] = back_pieces[i].new([7, i], self, :white)
     end
     
     8.times do |i|
        @board[1][i] = Pawn.new([1, i], self, :black)
        @board[6][i] = Pawn.new([6, i], self, :white)
     end
   
  end
  
  def render
    @board.map do |row|
      row.map do |piece|
        piece.to_s
      end
    end
  end 
  
  
  def in_check?(color)
    opponent_pieces = pieces.select { |piece| piece.color != color }
    opponent_moves = []
    opponent_pieces.each { |piece| opponent_moves.concat(piece.moves) }
    opponent_moves.compact.include?(king_pos(color))   
  end
  
  def pieces
    @board.flatten.compact
  end
  
  def pieces_of_color(color)
    @board.flatten.compact.select { |piece| piece.color == color }
  end
  
  def king_pos(color)
     pieces.find { |piece| piece.is_a?(King) && piece.color == color }.pos
  end
  
  def move(start, end_pos)
    raise "No piece at start" if self[start].nil?
    raise "Cannot move to end_pos" unless self[start].moves.include?(end_pos)
    raise "in check" unless valid_moves.include?(end_pos)
    move!(start, end_pos)
  end
  
  def move!(start, end_pos)
    piece_to_move = self[start]
    self[end_pos] = piece_to_move
    self[start] = nil
    piece_to_move.pos = end_pos
    self
  end
  
  def display_board
    @board.flatten.map do |piece|
      '-' if piece.nil?
      piece.to_s
    end
  end
  
  def dup_board
    board_copy = Board.new(false)
    pieces.each do |piece|
      board_copy[piece.pos] =
        piece.class.new(piece.pos.dup, board_copy, piece.color)
    end
    board_copy 
  end
  
  def valid_moves
    valid_moves = []
    pieces.each do |piece|
      piece.moves.each do |move|
       valid_moves << move unless move_into_check?(piece.pos, move)
      end
    end
    valid_moves
  end
  
  def move_into_check?(start, end_pos)
    changed_board = dup_board.move!(start, end_pos)
    changed_board.in_check?(changed_board[end_pos].color)
  end
  
  def checkmate?(color)
    self.valid_moves.empty?
  end
  
end
#
# a = Board.new
# a.display_board