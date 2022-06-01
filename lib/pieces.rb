require 'pry-byebug'
require_relative "board"
require_relative "tree"
require_relative "decoder"

class Piece
  include Decoder
  attr_accessor :pos, :unicode, :color, :pos_arr, :moves
  def initialize(start_pos, unicode, color)
    @pos = start_pos
    @pos_arr = [Decoder.decode_col(@pos[0]), Decoder.decode_rank(@pos[1])]

    @moves = Tree.new(@pos_arr)

    @unicode = " " + unicode + " "
    @color = color
    # byebug
  end

  def update_position(board, destination)
    # clean previous spot
    board.clean(@pos_arr)
    @pos = destination
    @pos_arr = [Decoder.decode_col(@pos[0]), Decoder.decode_rank(@pos[1])]
    @moves = Tree.new(@pos_arr)
  end

  def show_position(curr_pos)
    puts "Current Position is: #{curr_pos}"

  end
end

class King < Piece
  def generate_moveset(board)
    col = @moves.data[0]
    rank = @moves.data[1]

    if col - 1 >= 0 && rank - 1 >= 0
      spot = [col - 1, rank - 1]
      @moves.child.push(spot) if board.board[spot[1]][spot[0]].nil? || !board.board[spot[1]][spot[0]].color.eql?(self.color)
    end
    if col - 1 >= 0 # && rank - 0 >= 0
      spot = [col - 1, rank]
      @moves.child.push(spot) if board.board[spot[1]][spot[0]].nil? || !board.board[spot[1]][spot[0]].color.eql?(self.color)
    end
    if col - 1 >= 0 && rank + 1 <= 7
      spot = [col - 1, rank + 1]
      @moves.child.push(spot) if board.board[spot[1]][spot[0]].nil? || !board.board[spot[1]][spot[0]].color.eql?(self.color)
    end
    if rank + 1 <= 7
      spot = [col, rank + 1]
      @moves.child.push(spot) if board.board[spot[1]][spot[0]].nil? || !board.board[spot[1]][spot[0]].color.eql?(self.color)
    end
    if col + 1 <= 7 && rank + 1 <= 7
      spot = [col + 1, rank + 1]
      @moves.child.push(spot) if board.board[spot[1]][spot[0]].nil? || !board.board[spot[1]][spot[0]].color.eql?(self.color)
    end
    if col + 1 <= 7
      spot = [col + 1, rank]
      @moves.child.push(spot) if board.board[spot[1]][spot[0]].nil? || !board.board[spot[1]][spot[0]].color.eql?(self.color)
    end
    if col + 1 <= 7 && rank - 1 >= 0
      spot = [col + 1, rank - 1]
      @moves.child.push(spot) if board.board[spot[1]][spot[0]].nil? || !board.board[spot[1]][spot[0]].color.eql?(self.color)
    end
    if rank - 1 >= 0
      spot = [col, rank - 1]
      @moves.child.push(spot) if board.board[spot[1]][spot[0]].nil? || !board.board[spot[1]][spot[0]].color.eql?(self.color)
    end
  end
end

class Queen < Piece
end

class Rook < Piece
  def generate_moveset
    col = @moves.data[0]
    rank = @moves.data[1]
  
    # traverse board leftward, upward, rightward, downward
    # until the next move is out of bounds OR another piece,
    # add move to moveset
  end
end

class Bishop < Piece
end

class Knight < Piece
  def generate_moveset(board)
    # pos_x1 = col + 1
    # pos_x2 = col + 2
    # neg_x1 = col - 1
    # neg_x2 = col - 2
    # pos_y1 = rank + 1
    # pos_y2 = rank + 2
    # neg_y1 = rank - 1
    # neg_y2 = rank - 2

    # from current position, add legal movements into the @direct_moves Tree structure
    # legal moves are spots that don't have another piece on them AND on the board
    #  check if destination spot is on board
    #  THEN, check if another piece is on the destination spot
      # get all legal positions the knight can take on and make that a child in the tree
    col = @moves.data[0]
    rank = @moves.data[1]

    # byebug

    if col - 2 >= 0 && rank + 1 <= 7
      spot = [col - 2, rank + 1]
      @moves.child.push(spot) if board.board[spot[1]][spot[0]].nil? || !board.board[spot[1]][spot[0]].color.eql?(self.color)
    end
    if col - 1 >= 0 && rank + 2 <= 7
      spot = [col - 1, rank + 2]
      @moves.child.push(spot) if board.board[spot[1]][spot[0]].nil? || !board.board[spot[1]][spot[0]].color.eql?(self.color)
    end
    if col + 2 <= 7 && rank + 1 <= 7
      spot = [col + 2, rank + 1]
      @moves.child.push(spot) if board.board[spot[1]][spot[0]].nil? || !board.board[spot[1]][spot[0]].color.eql?(self.color)
    end
    if col + 1 <= 7 && rank + 2 <= 7
      spot = [col + 1, rank + 2]
      @moves.child.push(spot) if board.board[spot[1]][spot[0]].nil? || !board.board[spot[1]][spot[0]].color.eql?(self.color)
    end
    if col - 2 >= 0 && rank - 1 >= 0
      spot = [col - 2, rank - 1]
      @moves.child.push(spot) if board.board[spot[1]][spot[0]].nil? || !board.board[spot[1]][spot[0]].color.eql?(self.color)
    end
    if col - 1 >= 0 && rank - 2 >= 0
      spot = [col - 1, rank - 2]
      @moves.child.push(spot) if board.board[spot[1]][spot[0]].nil? || !board.board[spot[1]][spot[0]].color.eql?(self.color)
    end
    if col + 2 <= 7 && rank - 1 >= 0
      spot = [col + 2, rank - 1]
      @moves.child.push(spot) if board.board[spot[1]][spot[0]].nil? || !board.board[spot[1]][spot[0]].color.eql?(self.color)
    end
    if col + 1 <= 7 && rank - 2 >= 0
      spot = [col + 1, rank - 2]
      @moves.child.push(spot) if board.board[spot[1]][spot[0]].nil? || !board.board[spot[1]][spot[0]].color.eql?(self.color)
    end
  end
end

class Pawn < Piece
end