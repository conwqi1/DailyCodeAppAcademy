# encoding: UTF-8
require_relative './stepping_piece.rb'
class Knight < SteppingPieces

  def move_directions
    [[2, 1], [2, -1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2]]
  end
  
  def to_s
    self.color == :white ? "♘" : "♞"
  end

end