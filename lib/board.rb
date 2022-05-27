require 'pry-byebug'

class Board
  attr_accessor :board
  def initialize
    @board = Array.new(8) { Array.new(8) }
    puts "Board initalized."
  end

  def place(piece)
    col = piece.pos[0]
    rank = piece.pos[1]
    @board[decode_rank(rank)][decode_col(col)] = piece.unicode
    puts "#{piece.unicode} placed onto board at #{piece.pos}."
  end

  def create_interface
    @board.each
  end

  def print_interface
    string = ""
    @board.each_index do |row_idx|
      @board[row_idx].each_index do |elem_idx|
        # [0][0] black bg
        if row_idx % 2 == 0 && elem_idx % 2 == 0 # black bg for even row, even col
          if @board[row_idx][elem_idx].nil?
            string.concat("\e[100m#{"   "}\e[0m")
          else
            string.concat("\e[100m#{ @board[row_idx][elem_idx] }\e[0m")
          end
        elsif row_idx % 2 == 0 && elem_idx % 2 == 1 # white bg for even row, odd col
          if @board[row_idx][elem_idx].nil?
            string.concat("\e[107m#{"   "}\e[0m")
          else
            string.concat("\e[107m#{ @board[row_idx][elem_idx] }\e[0m")
          end
        elsif row_idx % 2 == 1 && elem_idx % 2 == 0 # white bg for odd row, even col
          if @board[row_idx][elem_idx].nil?
            string.concat("\e[107m#{"   "}\e[0m")
          else
            string.concat("\e[107m#{ @board[row_idx][elem_idx] }\e[0m")
          end
        elsif row_idx % 2 == 1 && elem_idx % 2 == 1 # black bg for odd row, odd col
          if @board[row_idx][elem_idx].nil?
            string.concat("\e[100m#{"   "}\e[0m")
          else
            string.concat("\e[100m#{ @board[row_idx][elem_idx] }\e[0m")
          end
        end
      end
      puts string
      string = ""
    end
  end

  def decode_col(col_idx)
    decoder(col_idx)
  end

  def decode_rank(rank_idx)
    decoder(rank_idx)
  end

  def decoder(idx)
    case idx
    when "a"
      0
    when "b"
      1
    when "c"
      2
    when "d"
      3
    when "e"
      4
    when "f"
      5
    when "g"
      6
    when "h"
      7
    when "1"
      0
    when "2"
      1
    when "3"
      2
    when "4"
      3
    when "5"
      4
    when "6"
      5
    when "7"
      6
    when "8"
      7
    end
  end
end