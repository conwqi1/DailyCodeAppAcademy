class Rook < SlidingPieces
  
  def move_direction
    straight_moves
  end
  
  def to_s
    "R"
  end
end