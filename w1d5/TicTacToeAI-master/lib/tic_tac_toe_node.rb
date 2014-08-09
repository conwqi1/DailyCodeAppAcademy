require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end
  
  attr_reader :board, :next_mover_mark, :prev_move_pos

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    child_boards = []
    subsequent_mover_mark = @next_mover_mark == :x ? :o : :x
    
    (0..2).each do |i|
      (0..2).each do |j|
        board_mutable = self.board.dup
        p "#{board_mutable} - board mutable"
        p board_mutable[i][j]
        if board_mutable[[i, j]].empty?
          board_mutable[[i, j]] = @next_mover_mark
          new_ttt_node = TicTacToeNode.new(board_mutable, subsequent_mover_mark, [i, j])
          child_boards << new_ttt_node
        end
      end
    end
    
    child_boards
  end

  def losing_node?(player)
    
    
    return true if (@board.over?) && (board.winner == player) 
    if next_mover_mark == player && losing_node?
    
    
    end
    
    #return false if @board.over && @board.winner == next_player_move
    
  end

  def winning_node?(player)
  end
end
