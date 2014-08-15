# encoding: UTF-8
require_relative './sliding_piece.rb'
class Rook < SlidingPieces
  
  def move_directions
    straight_moves
  end
  
  def to_s
    self.color == :white ? "♖" : "♜"
  end
end