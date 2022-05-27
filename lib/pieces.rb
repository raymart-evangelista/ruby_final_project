require_relative "board"

class Piece
  attr_accessor :pos, :unicode, :color
  def initialize(start_pos, unicode, color)
    @pos = start_pos
    @unicode = " " + unicode + " "
    @color = color
  end

  def update_position(curr_pos, destination)
    curr_pos = destination
  end

  def show_position(curr_pos)
    puts "Current Position is: #{curr_pos}"
  end
end

class King < Piece
end

class Queen < Piece
end

class Rook < Piece
end

class Bishop < Piece
end

class Knight < Piece
end

class Pawn < Piece
end