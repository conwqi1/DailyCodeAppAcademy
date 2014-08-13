class Queen < SlidingPieces
  
  def move_directions
      straight_moves + diagonal_moves
  end
  
  def to_s
    "Q"
  end

end