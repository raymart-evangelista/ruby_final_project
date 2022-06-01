require_relative 'board'
require_relative 'pieces'

class Game
  attr_accessor :game_board
  def initialize
    # initialize game_board
    @game_board = Board.new
    init_pieces
    # initialize pieces onto starting positions on game_board
    @game_board.print_interface
    # @game_board.flip_interface
  end

  def play_game
    loop do
      # get player 1
      # get player 2
      # current player decides which piece to move
      # piece.gets.chomp
      # verify piece
      # find valid spots to move to
      # byebug
      @w_rook2.generate_moveset(@game_board)

      # pass moveset into board and check for spots to move to
      # @game_board.update_interface(curr_moveset)
      @game_board.update_interface(@w_rook2)
      
      # update interface to reflect moveset
      # get player input for where to move piece

      loop do
        puts "Where do you want to move rook?"
        input = gets.chomp
        if @game_board.verify_move(@w_rook2, input)
          @w_rook2.update_position(@game_board, input)
          @game_board.place(@w_rook2)
          @w_rook2.generate_moveset(@game_board)
          # @game_board.update_spot
          @game_board.update_interface(@w_rook2)
          break
        end
      end

      # validate that player choice reflects the available choices
      # move piece
      # @game_board.place
      # @game_board.clean_spot
    end
  end

  def init_pieces
    @w_king = King.new("e1", "\u2654", "white")
    @w_queen = Queen.new("d1", "\u2655", "white")
    @w_rook1 = Rook.new("a1", "\u2656", "white")
    @w_rook2 = Rook.new("h1", "\u2656", "white")
    @w_bishop1 = Bishop.new("c1", "\u2657", "white")
    @w_bishop2 = Bishop.new("f1", "\u2657", "white")
    @w_knight1 = Knight.new("b1", "\u2658", "white")
    @w_knight2 = Knight.new("g1",  "\u2658", "white")
    # @w_pawn1 = Pawn.new("a2", "\u2659", "white")
    # @w_pawn2 = Pawn.new("b2", "\u2659", "white")
    # @w_pawn3 = Pawn.new("c2", "\u2659", "white")
    # @w_pawn4 = Pawn.new("d2", "\u2659", "white")
    # @w_pawn5 = Pawn.new("e2", "\u2659", "white")
    # @w_pawn6 = Pawn.new("f2", "\u2659", "white")
    # @w_pawn7 = Pawn.new("g2", "\u2659", "white")
    # @w_pawn8 = Pawn.new("h2", "\u2659", "white")
    game_board.place(@w_king)
    game_board.place(@w_queen)
    game_board.place(@w_rook1)
    game_board.place(@w_rook2)
    game_board.place(@w_bishop1)
    game_board.place(@w_bishop2)
    game_board.place(@w_knight1)
    game_board.place(@w_knight2)
    # game_board.place(@w_pawn1)
    # game_board.place(@w_pawn2)
    # game_board.place(@w_pawn3)
    # game_board.place(@w_pawn4)
    # game_board.place(@w_pawn5)
    # game_board.place(@w_pawn6)
    # game_board.place(@w_pawn7)
    # game_board.place(@w_pawn8)

    @b_king = King.new("e8", "\u265A", "black")
    @b_queen = Queen.new("d8", "\u265B", "black")
    @b_rook1 = Rook.new("a8", "\u265C", "black")
    @b_rook2 = Rook.new("h8",  "\u265C", "black")
    @b_bishop1 = Bishop.new("c8", "\u265D", "black")
    @b_bishop2 = Bishop.new("f8", "\u265D", "black")
    @b_knight1 = Knight.new("b8", "\u265E", "black")
    @b_knight2 = Knight.new("g8", "\u265E", "black")
    # @b_pawn1 = Pawn.new("a7", "\u265F", "black")
    # @b_pawn2 = Pawn.new("b7", "\u265F", "black")
    # @b_pawn3 = Pawn.new("c7", "\u265F", "black")
    # @b_pawn4 = Pawn.new("d7", "\u265F", "black")
    # @b_pawn5 = Pawn.new("e7", "\u265F", "black")
    # @b_pawn6 = Pawn.new("f7", "\u265F", "black")
    # @b_pawn7 = Pawn.new("g7", "\u265F", "black")
    # @b_pawn8 = Pawn.new("h7", "\u265F", "black")

    game_board.place(@b_king)
    game_board.place(@b_queen)
    game_board.place(@b_rook1)
    game_board.place(@b_rook2)
    game_board.place(@b_bishop1)
    game_board.place(@b_bishop2)
    game_board.place(@b_knight1)
    game_board.place(@b_knight2)
    # game_board.place(@b_pawn1)
    # game_board.place(@b_pawn2)
    # game_board.place(@b_pawn3)
    # game_board.place(@b_pawn4)
    # game_board.place(@b_pawn5)
    # game_board.place(@b_pawn6)
    # game_board.place(@b_pawn7)
    # game_board.place(@b_pawn8)
  end
end