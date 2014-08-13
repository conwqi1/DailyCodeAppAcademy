class SlidingPieces < Piece #bishop moves diagonally, rook moves up/down left/right, queen moves like bishop&rook
  STRAIGHT_OFFSET = [[1, 0], [0, 1], [-1, 0], [0, -1]]
  DIAGONAL_OFFSET = [[1, 1], [-1, -1], [1, -1], [-1, 1]]
 
  def straight_moves
    STRAIGHT_OFFSET
  end
  
  def diagonal_moves
     DIAGONAL_OFFSET
  end
  
  def moves
    valid_moves = []
    move_directions.each do |(x_dir, y_dir)|
      current_pos = pos
      counter = 1
      
      until current_pos[0] == 7 || current_pos[1] == 7  
        current_pos = [pos[0] + (x_dir * counter), pos[1] + (y_dir * counter)]
        at_pos = board[current_pos]
        if at_pos.nil? || at_pos.color != self.color
          valid_moves << current_pos
        end
        break unless at_pos.nil?
        counter += 1
      end
    end
       
    valid_moves
  end
  
  def move_direction
  
  end
  
end





