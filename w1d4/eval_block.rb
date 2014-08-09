def eval (*arr, &proc)
  puts "No Block Given" if proc.nil?
  # p arr
  proc.call(*arr)
end


eval("Kerry", "Washington", 23) do |fname, lname, score|
  puts "#{lname}, #{fname} won #{score} votes."
end

eval(1,2,3,4,5) do |*args|
  puts args.inject(:+)
end
