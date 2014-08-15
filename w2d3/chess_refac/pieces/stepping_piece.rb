require_relative './piece.rb'
class SteppingPieces < Piece #knight moves 2-1, can jump pieces, king moves 1 in any direction cannot jump
  
  def moves
    valid_moves = []
    move_directions.each do |x_dir, y_dir|
      current_pos = [pos[0] + x_dir, pos[1] + y_dir]
                                
      if current_pos[0] <= 7 && current_pos[1] <= 7 
      at_pos = board[current_pos]
        if at_pos.nil? || at_pos.color != self.color
          valid_moves << current_pos if (current_pos[0] >= 0 && 
            current_pos[0] < 8 && current_pos[1] >= 0 && current_pos[1] < 8)
        end
      end      
    end
    valid_moves
  end

end

  

  