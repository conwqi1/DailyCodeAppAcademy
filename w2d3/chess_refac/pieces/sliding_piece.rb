require_relative './piece.rb'
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
    move_directions.each do |x_dir, y_dir|
      current_pos = pos
      counter = 1
      
      
      until current_pos[0] >= 7 || current_pos[1] >= 7  
    
        current_pos = [pos[0] + (x_dir * counter), pos[1] + (y_dir * counter)]
        p " #{current_pos} current pos"
        p " #{board[current_pos]} board current pos"
        p "#{board} board"
        
        at_pos = board[current_pos]
        if at_pos.nil? || at_pos.color != self.color
          valid_moves << current_pos if (current_pos[0] >= 0 && 
            current_pos[0] < 8 && current_pos[1] >= 0 && current_pos[1] < 8)
        end
        break unless at_pos.nil?
        counter += 1
      end
    end   
    valid_moves
    #p valid_moves
  end
  
  def moves
    valid_moves = []
    current_pos = pos
    new_pos = pos
    counter = 1
    
    move_directions.each do |x_dir, y_dir|
      until !in_bounds?(new_pos)
      new_pos = [new_pos[0] + (x_dir * counter), new_pos[1] + (y_dir * counter)]
      valid_moves << new_pos unless in_bounds?(new_pos)
      
      
    
  end
  
  def in_bounds?(pos)
    return false if pos[0] > 7 || pos[0] < 0 || pos[1] > 7 || pos[1] < 0
    true
  end
    
end





