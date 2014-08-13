class Board
  
  def initialize
    @board = Array.new(8){Array.new(8)}
    set_board
  end
  
  def [](pos)
    row, col = pos
    @board[row][col]
  end
  
  def set_board
    @board[0][0] = Rook.new([0,0], @board, :black)
    @board[0][1] = Knight.new([0,1], @board, :black)
    @board[0][2] = Bishop.new([0,2], @board, :black)
    @board[0][3] = Queen.new([0,3], @board, :black)
    @board[0][4] = King.new([0,4], @board, :black)
    @board[0][5] = Bishop.new([0,5], @board, :black)
    @board[0][6] = Knight.new([0,6], @board, :black)
    @board[0][7] = Rook.new([0,7], @board, :black)
    
    @board[7][0] = Rook.new([7,0], @board, :white)
    @board[7][1] = Knight.new([7,1], @board, :white)
    @board[7][2] = Bishop.new([7,2], @board, :white)
    @board[7][3] = Queen.new([7,3], @board, :white)
    @board[7][4] = King.new([7,4], @board, :white)
    @board[7][5] = Bishop.new([7,5], @board, :white)
    @board[7][6] = Knight.new([7,6], @board, :white)
    @board[7][7] = Rook.new([7,7], @board, :white)
    
  end
  
  def render
    @board.map do |row|
      row.map do |piece|
        case
        when piece.is_a?(Rook) && piece.color == :white
          "wR"
        when piece.is_a?(Rook) && piece.color == :black
          "bR"
        when piece.is_a?(Bishop) && piece.color == :white
          "wB"
        when piece.is_a?(Bishop) && piece.color == :black
          "bB"
        when piece.is_a?(Knight) && piece.color == :white
          "k"
        when piece.is_a?(King)
          "K"
        when piece.is_a?(Queen)
          "Q"
        when piece.is_a?(NilClass)
          "_"
        end
      end
    end
  end
  
  
  def in_check?(color)
    #loop through pieces of opposite color
    #run moves method on each piece
    #return true if King of opposite color is in possible moves
    opponent_pieces = pieces.select { |piece| piece.color != color }
    opponent_moves = []
    opponent_pieces.each { |piece| opponent_moves << piece.moves }
    opponent_moves.include?(king_pos(color))   
  end
  
  def pieces
    @board.flatten.compact
  end
  
  def king_pos(color)
     pieces.find { |piece| piece.is_a?(King) && piece.color == color }.pos
  end
  
  def move(start, end_pos)
    raise "No piece at start" if @board[start].nil?
    raise "Cannot move to end_pos" unless @board[start].moves.include?(end_pos)
    @board[start],  @board[end_pos] = nil, @board[start]
    @board[start].pos = end_pos
  end
  
  def display_board
    @board.flatten.map do |piece|
      nil if piece.nil?
      piece.to_s
    end
  end
  
end
#
# a = Board.new
# a.display_board