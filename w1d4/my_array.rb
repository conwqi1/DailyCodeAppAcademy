class Array

  def my_each(&proc)
    self.length.times { |x| proc.call(self[x]) }
  end
  
  def my_map(&proc)
    output_array = []
    self.my_each {|x| output_array << proc.call(x) }
    output_array
  end
  
  def my_select(&proc)
    output_array= []
    self.my_each {|x| output_array << x if proc.call(x)}
    output_array
  end

# { |sum, n| sum + n }

  def my_inject(&proc)

    if self[0].class == Fixnum
      total = 0
    elsif self[0].class == String
      total = ""
    elsif self[0].class == Array
      total = []
    end
    
    self.my_each do |x|
      total = proc.call(total, x)
    end
    total
  end  
  
  #{|num1, num2| num1 <=> num2 }
  def my_sort! (&proc)
     self.each_index do |i|
       next if i > self.length - 1
       start = i + 1
       (start...self.length).each do |j|
         if proc.call(self[i], self[j]) == 1
           self[i], self[j] = self[j], self[i]
         end
       end
     end  
     self
  end
  
  def my_sort(&proc)
    dup_array = self.dup
    dup_array.my_sort!(&proc)
  end

end