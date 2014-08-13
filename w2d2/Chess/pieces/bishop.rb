class Bishop < SlidingPieces
  
  def move_direction
    diagonal_moves
  end
  
  def to_s
    "B"
  end
end