require_relative 'decoder'
require 'pry-byebug'

class Board
  include Decoder
  attr_accessor :board
  def initialize
    @board = Array.new(8) { Array.new(8) }
    puts "Board initalized."
  end

  def place(piece)
    col = piece.pos[0]
    rank = piece.pos[1]
    @board[Decoder.decode_rank(rank)][Decoder.decode_col(col)] = piece
    puts "#{piece.unicode} placed onto board at #{piece.pos}."
  end

  def clean(spot)
    col = spot[0]
    rank = spot[1]
    @board[rank][col] = nil
  end

  def spot_taken?(position)
    col = position[0]
    rank = position[1]
    true unless @board[rank][col].nil?
  end

  def verify_move(piece, input)
    col = Decoder.decode_col(input[0])
    rank = Decoder.decode_rank(input[1])
    # byebug
    if @board[rank][col].nil? && piece.moves.child.include?([col,rank])
      true
    elsif piece.moves.child.include?([col,rank])
      true
    else
      false
    end
  end

  def update_interface(piece)
    moves = piece.moves
    col = piece.moves.data[0]
    rank = piece.moves.data[1]
    spot = [rank, col]
    # get piece color
    piece_color = piece.color

    puts "  [a][b][c][d][e][f][g][h]"
    string = ""
    @board.each_index do |rank_idx|
      string.concat("#{rank_idx+1} ")
      @board[rank_idx].each_index do |col_idx|

        # if the current spot is nil-->an open spot,
        # check if the spot is where the given piece can move to
        # if it is, print green color
        # else print normally
        curr_spot = @board[rank_idx][col_idx]
        if curr_spot.nil?
          if moves.child.include?([col_idx, rank_idx])
            if rank_idx % 2 == 0 && col_idx % 2 == 0
              string.concat("\e[100m#{" \u25cf "}\e[0m")
            elsif rank_idx % 2 == 0 && col_idx % 2 == 1
              string.concat("\e[107m#{" \u25cf "}\e[0m")
            elsif rank_idx % 2 == 1 && col_idx % 2 == 0
              string.concat("\e[107m#{" \u25cf "}\e[0m")
            elsif rank_idx % 2 == 1 && col_idx % 2 == 1
              string.concat("\e[100m#{" \u25cf "}\e[0m")
            end
            # string.concat("\e[102m#{"   "}\e[0m")
          else
            if rank_idx % 2 == 0 && col_idx % 2 == 0 # black bg for even row, even col
              if @board[rank_idx][col_idx].nil?
                string.concat("\e[100m#{"   "}\e[0m")
              else
                string.concat("\e[100m#{ @board[rank_idx][col_idx].unicode }\e[0m")
              end
            elsif rank_idx % 2 == 0 && col_idx % 2 == 1 # white bg for even row, odd col
              if @board[rank_idx][col_idx].nil?
                string.concat("\e[107m#{"   "}\e[0m")
              else
                string.concat("\e[107m#{ @board[rank_idx][col_idx].unicode }\e[0m")
              end
            elsif rank_idx % 2 == 1 && col_idx % 2 == 0 # white bg for odd row, even col
              if @board[rank_idx][col_idx].nil?
                string.concat("\e[107m#{"   "}\e[0m")
              else
                string.concat("\e[107m#{ @board[rank_idx][col_idx].unicode }\e[0m")
              end
            elsif rank_idx % 2 == 1 && col_idx % 2 == 1 # black bg for odd row, odd col
              if @board[rank_idx][col_idx].nil?
                string.concat("\e[100m#{"   "}\e[0m")
              else
                string.concat("\e[100m#{ @board[rank_idx][col_idx].unicode }\e[0m")
              end
            end
          end
        # else, the spot isn't open, it can either be taken by self or opponent
        else
          # get the piece's color of the current spot 
          spot_color = @board[rank_idx][col_idx].color
          if piece_color.eql?(spot_color)
            # if it's the same spot as the piece make BLUE, otherwise print normally 
            if piece.moves.data.eql?(curr_spot.moves.data)
              string.concat("\e[104m#{ piece.unicode }\e[0m")
            elsif rank_idx % 2 == 0 && col_idx % 2 == 0
              string.concat("\e[100m#{ @board[rank_idx][col_idx].unicode }\e[0m")
            elsif rank_idx % 2 == 0 && col_idx % 2 == 1 # white bg for even row, odd col
              string.concat("\e[107m#{ @board[rank_idx][col_idx].unicode }\e[0m")
            elsif rank_idx % 2 == 1 && col_idx % 2 == 0 # white bg for odd row, even col
              string.concat("\e[107m#{ @board[rank_idx][col_idx].unicode }\e[0m")
            elsif rank_idx % 2 == 1 && col_idx % 2 == 1 # black bg for odd row, odd col
              string.concat("\e[100m#{ @board[rank_idx][col_idx].unicode }\e[0m")
            end
          # else, spot color is opponents, in that case if it's a valid spot a piece can take, show RED, else print normally
          else
            if moves.child.include?(curr_spot.moves.data)
              string.concat("\e[101m#{ curr_spot.unicode }\e[0m")
            # else print normally
            else
              if rank_idx % 2 == 0 && col_idx % 2 == 0
                string.concat("\e[100m#{ curr_spot.unicode }\e[0m")
              elsif rank_idx % 2 == 0 && col_idx % 2 == 1 # white bg for even row, odd col
                string.concat("\e[107m#{ curr_spot.unicode }\e[0m")
              elsif rank_idx % 2 == 1 && col_idx % 2 == 0 # white bg for odd row, even col
                string.concat("\e[107m#{ curr_spot.unicode }\e[0m")
              elsif rank_idx % 2 == 1 && col_idx % 2 == 1 # black bg for odd row, odd col
                string.concat("\e[100m#{ curr_spot.unicode }\e[0m")
              end
            end
          end
        end
      end
      string.concat(" #{rank_idx+1}")
      puts string
      string = ""
    end
    puts "  [a][b][c][d][e][f][g][h]"
  end

  def print_interface
    puts "  [a][b][c][d][e][f][g][h]"
    string = ""
    @board.each_index do |row_idx|
      string.concat("#{row_idx+1} ")
      @board[row_idx].each_index do |elem_idx|
        # [0][0] black bg
        if row_idx % 2 == 0 && elem_idx % 2 == 0 # black bg for even row, even col
          if @board[row_idx][elem_idx].nil?
            string.concat("\e[100m#{"   "}\e[0m")
          else
            string.concat("\e[100m#{ @board[row_idx][elem_idx].unicode }\e[0m")
          end
        elsif row_idx % 2 == 0 && elem_idx % 2 == 1 # white bg for even row, odd col
          if @board[row_idx][elem_idx].nil?
            string.concat("\e[107m#{"   "}\e[0m")
          else
            string.concat("\e[107m#{ @board[row_idx][elem_idx].unicode }\e[0m")
          end
        elsif row_idx % 2 == 1 && elem_idx % 2 == 0 # white bg for odd row, even col
          if @board[row_idx][elem_idx].nil?
            string.concat("\e[107m#{"   "}\e[0m")
          else
            string.concat("\e[107m#{ @board[row_idx][elem_idx].unicode }\e[0m")
          end
        elsif row_idx % 2 == 1 && elem_idx % 2 == 1 # black bg for odd row, odd col
          if @board[row_idx][elem_idx].nil?
            string.concat("\e[100m#{"   "}\e[0m")
          else
            string.concat("\e[100m#{ @board[row_idx][elem_idx].unicode }\e[0m")
          end
        end
      end
      string.concat(" #{row_idx+1}")
      puts string
      string = ""
    end
    puts "  [a][b][c][d][e][f][g][h]"
  end

  def flip_interface
    @board = @board.reverse
    print_interface
  end
end