class Piece
  attr_reader :pos, :board, :color
  attr_writer :pos
  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end
  
  def render
    mark
  end
  
  

  
end
