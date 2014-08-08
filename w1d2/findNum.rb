require "debugger"

def findN
  num=250
  while num%7!=0 do
    num+=1
  end
  num
end

def factors number
  factors = []
  (1..number).each do |factor|
    factors << factor if number % factor == 0
  end
  factors
end

def bubble_sort array
  did_swap = true
  sorted_index = array.length - 1
  
  while did_swap do
    did_swap = false
    
    (0).upto(sorted_index - 1).each do |index|
      puts "#{array[index]} #{array[index+1]}"
  
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
        
        did_swap = true
      end
    end
    
    sorted_index -= 1
  end
  
  array 
end

puts bubble_sort [ 2, 4, 1, 9, 10, 5 ]