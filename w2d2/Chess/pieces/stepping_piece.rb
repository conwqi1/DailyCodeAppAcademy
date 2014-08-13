class SteppingPieces < Piece #knight moves 2-1, can jump pieces, king moves 1 in any direction cannot jump
  
  def moves
    valid_moves = []
    move_direction.each do |(x_dir, y_dir)|
      current_pos = [pos[0] + x_dir, pos[1] + y_dir]
      at_pos = board[current_pos]
      
      if current_pos[0] <= 7 && current_pos[1] <= 7 && 
        (at_pos.color.nil? || at_pos.color != self.color)
        valid_moves << current_pos
      end      
      valid_moves
    end
  end

end

  

  