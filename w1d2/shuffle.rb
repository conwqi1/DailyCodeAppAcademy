def readfile_shuffle filename
  lines = []
  File.foreach(filename) do |line|
    lines << line.chomp
  end
  lines.shuffle
end

def save_file filename, lines
  file = File.open("#{filename}-shuffled.txt", "w")
  lines.each do |line|
    file.puts line
  end
end

filename = "shuffle.rb"
lines = readfile_shuffle(filename)
save_file(filename, lines)
