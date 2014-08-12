def binary_search(arr, target)

  search_index = arr.length / 2
  
  #base case = you found the index value of your target 
  if arr[search_index] == target
    return search_index
  elsif arr[search_index] > target
    binary_search(arr[0..search_index], target) 
  else
    binary_search(arr[search_index..-1], target) + search_index
  end
end

a = [1,2,3,4,5]
puts binary_search(a, 4)


