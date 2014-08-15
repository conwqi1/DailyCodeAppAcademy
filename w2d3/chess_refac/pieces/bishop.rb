# encoding: UTF-8
require_relative './sliding_piece.rb'
class Bishop < SlidingPieces
  
  def move_directions
    diagonal_moves
  end
  
  def to_s
    self.color == :white ? "♗" : "♝"
  end
end