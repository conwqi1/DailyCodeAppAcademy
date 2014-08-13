class Knight < SteppingPieces

  def move_direction
    [[2, 1], [2, -1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2]]
  end
  def to_s
    "K"
  end

end