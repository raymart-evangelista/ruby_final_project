require "./lib/colors/colors.rb"

puts "\e[47m#{"  "}\e[0m"
puts "\e[40m#{"  "}\e[0m"
puts "Hello".bg_black
puts "Helllo".bg_blue
puts "\e[40m#{"  "}\e[0m"
puts "\e[107m#{"  "}\e[0m" + "\e[100m#{"  "}\e[0m"

string = ""
board = Array.new(8) { Array.new(8) }
board.each_index do |row_idx|
  board[row_idx].each_index do |elem_idx|
    if row_idx % 2 == 0 && elem_idx % 2 == 0
      string.concat("\e[107m#{"   "}\e[0m")
    elsif row_idx % 2 == 0 && elem_idx % 2 == 1
      string.concat("\e[100m#{"   "}\e[0m")
    elsif row_idx % 2 == 1 && elem_idx % 2 == 0
      string.concat("\e[100m#{"   "}\e[0m")
    elsif row_idx % 2 == 1 && elem_idx % 2 == 1
      string.concat("\e[107m#{" \u2658 "}\e[0m")
    end
  end
  puts string
  string = ""
end