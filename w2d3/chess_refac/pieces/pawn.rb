# encoding: UTF-8
require_relative "./piece.rb"
require 'debugger'

class Pawn < Piece
  def forward_direction 
    if self.color == :white
      -1
    else
      1
   end
 end
  
  def diagonal_attack
    corner_spaces = [[forward_direction, -1], [forward_direction, 1]]
    #pos = self.pos
    corner_spaces.map! do |delta_row, delta_col|
      [pos[0] + delta_row, pos[1] + delta_col]
    end
    corner_spaces.select! do |corner_space|
      spot = @board[corner_space]
      !spot.nil? && spot.color != self.color
    end
    corner_spaces
  end
  
  def move_directions
    if  self.pos[0] == 1 || self.pos[0] == 6
      [[forward_direction * 2 , 0], [forward_direction , 0]]
    else
      [[forward_direction, 0]]
    end
  end
  
  def moves #pawn
    valid_moves = []
    move_directions.each do |(x_dir, y_dir)|
      current_pos = [pos[0] + x_dir, pos[1] + y_dir]
      # debugger
      at_pos = board[current_pos]
      if (current_pos[0] <= 7 && current_pos[1] <= 7) && (at_pos.nil?)
      
        valid_moves << current_pos if (current_pos[0] >= 0 && 
            current_pos[0] < 8 && current_pos[1] >= 0 && current_pos[1] < 8)
      end      
    end
    valid_moves + diagonal_attack
  end
  
  def to_s
    self.color == :white ? "♙" : "♟"
  end

end
