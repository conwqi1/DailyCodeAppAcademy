def range(start_num, end_num)
  if end_num < start_num
    return []
  else
    range(start_num, end_num - 1) << end_num 
  end
end



arr = [2, 3, 4]

def sum_recursive(arr)
  if  arr.length == 0 
    return 0
  else
    arr[0] + sum_recursive(arr.drop(1))
  end
end


def sum_iterative(arr)
  sum = arr.each.inject{ |sum, x| sum + x }
end
