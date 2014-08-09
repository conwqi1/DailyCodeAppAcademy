def merge_sort(arr)
  if arr.length == 1
    #base case
  else
    #split it up?
  end
end

def merge(arr1, arr2)
  sorted_array = []
  arr1.each do |el1|
    arr2.each do |el2|
      if el1 < el2
        sorted_array << el1
      else 
        sorted_array << el2
      end
    end
  end
end

a = [1, 4]
b = [2, 8]

p merge(a,b)