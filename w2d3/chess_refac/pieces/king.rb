# encoding: UTF-8
require_relative './stepping_piece.rb'


class King < SteppingPieces

  def move_directions
    [[1, 0], [0, 1], [-1, 0], [0, -1], [1, 1], [-1, -1], [1, -1], [-1, 1]]
  end
  
  def to_s
    self.color == :white ? "♔" : "♚"
  end

end