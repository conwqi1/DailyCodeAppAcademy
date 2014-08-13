class The_pawn < Piece
  
  def move_direction
    case
    when self.pos[0] == 1 
      [[2, 0], [1, 0]]
    when self.pos[0] == 6
       [[-2, 0], [-1, 0]]
    when self.pos[pos[0] + 1, pos[1] + 1]    
  end
  
  def up_down?
    prev_steps = []
    self.
  end

end
