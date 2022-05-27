class Board
  attr_accessor :board
  def initialize
    @board = Array.new(8) { Array.new(8) }
    puts "Board initalized."
  end

  def create_interface
    @board.each
  end
end