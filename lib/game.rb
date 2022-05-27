require_relative 'board'
require_relative 'pieces'

class Game
  def initialize
    # initialize board
    board = Board.new
    init_pieces
    # initialize pieces onto starting positions on board
  end

  def init_pieces
    w_king = King.new("e1")
    w_queen = Queen.new("d1")
    w_rook1 = Rook.new("a1")
    w_rook2 = Rook.new("h1")
    w_bishop1 = Bishop.new("c1")
    w_bishop2 = Bishop.new("f1")
    w_knight1 = Knight.new("b1")
    w_knight2 = Knight.new("g1")
    w_pawn1 = Pawn.new("a2")
    w_pawn2 = Pawn.new("b2")
    w_pawn3 = Pawn.new("c2")
    w_pawn4 = Pawn.new("d2")
    w_pawn5 = Pawn.new("e2")
    w_pawn6 = Pawn.new("f2")
    w_pawn7 = Pawn.new("g2")
    w_pawn8 = Pawn.new("h2")

    b_king = King.new("e8")
    b_queen = Queen.new("d8")
    b_rook1 = Rook.new("a8")
    b_rook2 = Rook.new("h8")
    b_bishop1 = Bishop.new("c8")
    b_bishop2 = Bishop.new("f8")
    b_knight1 = Knight.new("b8")
    b_knight2 = Knight.new("g8")
    b_pawn1 = Pawn.new("a7")
    b_pawn2 = Pawn.new("b7")
    b_pawn3 = Pawn.new("c7")
    b_pawn4 = Pawn.new("d7")
    b_pawn5 = Pawn.new("e7")
    b_pawn6 = Pawn.new("f7")
    b_pawn7 = Pawn.new("g7")
    b_pawn8 = Pawn.new("h7")
  end
end