def rps(input)
  hash = {  
  "Rock" => "Scissors",
  "Scissors" => "Paper",
  "Paper" => "Rock"
  }
  temp=rand(0...3)
  puts compChoice = hash.keys[temp]
  puts "draw" if input == compChoice
  puts "win" if hash[input] == compChoice
  puts "loss" if hash[compChoice] == input
end

puts rps("Rock")
