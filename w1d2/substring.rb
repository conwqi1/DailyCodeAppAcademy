def read_dictionary filename = "dictionary.txt"
  dictionary = []
  File.foreach(filename) do |line|
    dictionary << line.chomp
  end
  dictionary
end

def substrings input
  output=[]
  dictionary = read_dictionary
  
  arr=input.split('')
  for i in 0..arr.length-1 do
    temp=""    
    for j in i..arr.length-1 do
      temp+=arr[j]
      output<<temp if dictionary.include? temp
    end
  end
   output
  
end

p substrings ("dictionary")