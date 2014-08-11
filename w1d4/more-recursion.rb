#Problem 1: You have array of integers. Write a recursive solution to find
#the sum of the integers.

def sum_recur(array)
  return array[0] if array.count == 1
  sum =array.last + sum_recur(array[0..-2])
  sum
end


#Problem 2: You have array of integers. Write a recursive solution to
#determine whether or not the array contains a specific value.

def includes?(array, target)
  if array.count == 0
      return false
  else
     return true if array.last == target
     includes?(array[0..-2], target)
  end
end


#Problem 3: You have an unsorted array of integers. Write a recursive
#solution to count the number of occurrences of a specific value.

def num_occur(array, target)
    return 0 if arrary.count == 0
    count += 1 if array.pop == target
    count = num_occur(array,target)
end

p num_occur([1,2,3,2,2,2,4], 2)
#Problem 4: You have array of integers. Write a recursive solution to
#determine whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)
  return false if array.count < 2
  return true if array[-1] + array[-2] == 12
  add_to_twelve?(array[0..-2])
end


#Problem 5: You have array of integers. Write a recursive solution to
#determine if the array is sorted.

def sorted?(array)
  return true if array.count < 2
  return false if array[-1] < array[-2]
  sorted?(array[0..-2])
end

#Problem 6: Write the code to give the value of a number after it is
#reversed. Must use recursion. (Don't use any #reverse methods!)

def reverse(number, reversed = [])
  origin = number.to_s.split('')
  if reversed.count == origin.count
    return reversed 
  else
    reversed << origin.last
    reverseddup = reversed
    reverse(origin[0..-2].join("")) 
    reversed.join("")
  end
end

#p reverse(123445)