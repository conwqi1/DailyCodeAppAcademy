def merge_sort(arr)
  return arr if arr.length < 2
  middle = arr.length / 2
  left = arr.take(middle)
  right = arr.drop(middle)
  sorted_left, sorted_right = merge_sort(left), merge_sort(right)
  merge(sorted_left, sorted_right)
end

def merge(left, right)
  merged = []
  until left.empty? || right.empty?
    merged << ((left.first < right.first) ? left.shift : right.shift)
  end
  merged + left + right
end




