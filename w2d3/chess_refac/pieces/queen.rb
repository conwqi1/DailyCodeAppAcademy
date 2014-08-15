# encoding: UTF-8
require_relative './sliding_piece.rb'
class Queen < SlidingPieces
  
  def move_directions
      straight_moves + diagonal_moves
  end
  
  def to_s
    self.color == :white ? "♕" : "♛"
  end

end