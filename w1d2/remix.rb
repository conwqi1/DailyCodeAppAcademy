def remix recipes
  alcohols = []
  mixers = []
  random_recipes = []
  
  recipes.shuffle.each do |recipe|
    # recipe == [ "rum", "coke"]
    alcohols << recipe[0]
    mixers << recipe[1]
  end
  for i in 0...mixers.length-1
    mixers[i], mixers[i+1] = mixers[i+1], mixers[i]
  end
   alcohols.each_with_index do |alcohol, index|
     random_recipes << [alcohol, mixers[index]]
  end
  
  random_recipes
end

puts remix([
  ["rum", "coke"],
  ["gin", "tonic"],
  ["scotch", "soda"]
])