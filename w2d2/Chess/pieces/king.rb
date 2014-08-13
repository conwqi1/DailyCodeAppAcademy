class King < SteppingPieces

  def move_direction
    [[1, 0], [0, 1], [-1, 0], [0, -1], [1, 1], [-1, -1], [1, -1], [-1, 1]]
  end
  
  def to_s
    "King"
  end

end