class Array

  def deep_dup
    arr = []
    self.each do |el|
      if el.is_a? Array
        arr << el.deep_dup
      else
        arr << el
      end
    end 
    arr
  end

end

a = [1, [2],[3,[3,4]]]
p a.deep_dup

b = [0]
p b.deep_dup