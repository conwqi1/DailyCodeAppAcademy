class Array
  def my_uniq
    for i in 0...self.length
      for j in (i + 1)...self.length
        puts self.length
        if self[i] == self[j]
          self.delete_at(j)
        end
      end
    end
    self
  end

  def two_sum
    good_pairs = []
    for i in 0...self.length
      for j in (i + 1)...self.length
        if self[i] + self[j] == 0
          good_pairs << [i, j]

        end
      end
    end
    good_pairs
  end
end

#p [1, 2, 2, 3, 3, 5, 5, 6, 5].my_uniq


def my_transpose(matrix)
  #algorithm
  for i in 0...matrix[0].length
    for j in (i + 1)...matrix[0].length
      temp = matrix[i][j]
      matrix[i][j] = matrix[j][i]
      matrix[j][i] = temp
    end
  end

  #printer
  for k in (0..(matrix[0].length-1))
    puts matrix[k].join("   ")
  end
  matrix
end

# p my_transpose([
#   [1, 2],
#   [3, 4],
#   [5, 6],
#   [7, 8]
# ])
#
# p my_transpose([
#   [1, 2, 3, 4],
#   [5, 6, 7, 8]
# ])

def stock_picker(data)
  #setup
  buy_day = 0
  sell_day = 0
  #algorithm
  for i in 0...data.length
    for j in (i+1)...data.length
      if (data[j]-data[i]) > (sell_day-buy_day)
        buy_day = i
        sell_day = j
      end
    end
  end
  #return
  [buy_day,sell_day]
end



def hanoi(gamesize)
  #setup
  start_array = []
  gamesize.times{|index| start_array<<index+1 }
  matrix=[start_array.reverse,[],[]]
  #play
  while true do
    #prints
    puts "Tower State"
    puts "Tower 1 " + matrix[0].join(" ")
    puts "Tower 2 " + matrix[1].join(" ")
    puts "Tower 3 " + matrix[2].join(" ")
    #player move
    while true do
      puts "enter the tower number you want to move disk from(1 2 3)"
      first_tower=gets.to_i-1
      puts "enter the tower number you want to move disk to"

      second_tower=gets.to_i-1
      if !matrix[first_tower].empty?
        if matrix[second_tower].empty?|| (matrix[first_tower].min < matrix[second_tower].min)
          matrix[second_tower]<<matrix[first_tower].min
          matrix[first_tower].delete(matrix[first_tower].min)
          break
        end
      end
      puts "INVALID MOVE: Enter another move"

    end

    #win conditions
    if matrix[1].length==gamesize || matrix[2].length==gamesize
      puts "you win"
      break
    end
  end
end

def num_to_s(num, base)
  arr = []
  to_shash={0 => "0", 1=> "1", 2=> "2", 3=> "3", 4=> "4", 5=> "5", 6=> "6", 7=> "7", 8=> "8", 9=> "9", 10=> "A", 11=> "B", 12=> "C", 13=> "D", 14=> "E", 15=> "F"}
  index = 0
  while (num / (base ** index)) != 0 # 14/ (16**0)
    arr << ((num / ( base ** index) ) % base) # 14 % 16
    index = index + 1
  end
  arr.reverse.map { |value| to_shash[value] }.join("")
end


def caesar(input, shift)
  alphabet = ["a","b", "c", "d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
  input.split("").map do |value|
    alphabet[((alphabet.find_index(value) + shift) % 26)]
  end.join("")
end

class MyHashSet
  def initialize
    @store={}
  end
  def insert(value)
    @store[value] = true if !@store.include?(value)
  end
  def include? (value)
     @store.member? (value)
  end
  def to_a
    @store.keys
  end
  def delete(value)
    if @store.include? (value)
      @store.delete_if{|key,val|key==value}
      true
    else
      false
    end
  end

  def union(set2)
    arr=self.to_a
    arr.each do |element|
      set2.insert(element)
    end
    set2
  end

  def intersection(set2)
    set3= MyHashSet.new
    arr=self.to_a
    arr.each do |element|
      set3.insert(element) if set2.include? element
    end
    set3
  end
  def minus(set2)
    set3= MyHashSet.new
    arr=self.to_a
    arr.each do |element|
      set3.insert(element) if !(set2.include? element)
    end
    set3
  end
end

def mult_by_2 arr
  arr.map{|value| value * 2}
end

class Array
  def my_each
    for i in 0...(self.length)
       yield self[i]
    end
    self
  end
end

return_value = [1, 2, 3].my_each do |num|
  #puts num
end.my_each do |num|
  #puts num
end





def find_median(integer)
  return integer[(integer.length / 2)] if integer.length % 2 == 1
  return (integer[(integer.length / 2) - 1]+integer[integer.length / 2]).to_f/2
end


def concatenate (input)
  input.inject{|val, n |  val + n  }
end

#puts concatenate(["Yay ", "for ", "strings!"])




#PROJECT

class Fixnum

  def in_words
    #generate hash for special cases
    hash_one = {
      0 => "zero",
      1=> "one",
      2=> "two", 3=> "three", 4=> "four", 5=> "five",
       6=> "six", 7=> "seven", 8=> "eight", 9=> "nine", 10=> "ten", 11=> "eleven",
       12=> "twelve", 13=> "thirteen", 14=> "forteen", 15=> "fifteen",
       16=> "sixteen", 17=> "seventeen", 18=> "eighteen", 19=> "nineteen",
       20=> "twenty", 30=> "thirty", 40=> "forty", 50=>"fifty", 60=> "sixty",
       70=> "seventy", 80=> "eighty", 90=> "ninety"}

       #break apart value into constiuant digits
       #then move them up a pattern of [hundreds, tens, ones]
    arr=self.to_s.split("").reverse
    for i in 0...arr.length
     arr[i] = (arr[i].to_i) *(10**(i%3))
    end

    #convert their names, by considering the three types broken above
    output_arr = []
    current_index = 0
    while current_index < arr.length do
      index = current_index

      #hundreds
      if index % 3 == 2 && arr[index] != nil
        output_arr << hash_one[arr[index]/100] + " hundred"
        index = index + 1
      end

      #tens
      if index % 3 == 1 && arr[index] != nil
        output_arr << hash_one[arr[index]]
        index = index + 1
      end

      #digits case
      if index % 3 == 0 && arr[index] != nil
        if  arr[index+1] != nil && (arr[index] + arr[index + 1 ] )<= 19
          output_arr << hash_one[arr[index] + arr[index + 1 ]]
          index = index + 2
        else
          output_arr << hash_one[arr[index]]
          index = index + 1
        end
      end
      current_index = index
    end
    #add titles of each section
    if self>=1_000_000_000_000
      output_arr.insert(12, "trillion")
    end
    if self>=1_000_000_000
      output_arr.insert(9, "billion")
    end
    if self>=1_000_000
      output_arr.insert(6, "million")
    end
    if self>=1_000
      output_arr.insert(3, "thousand")
    end


    output_arr.reverse.join(" ")
  end
end

puts 122_223_123.in_words
