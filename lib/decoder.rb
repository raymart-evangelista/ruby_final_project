module Decoder
  def self.decode_col(col_idx)
    decoder(col_idx)
  end

  def self.decode_rank(rank_idx)
    self.decoder(rank_idx)
  end

  def self.decoder(idx)
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