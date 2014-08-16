class Array
  
  def my_uniq
    unique = []
    self.each do |el|
      unique << el unless unique.include?(el)
    end
    unique
  end
  
  def two_sum
    two_sums = []
    0.upto(self.length - 2) do |i|
      (i + 1).upto(self.length - 1) do |j|
        two_sums << [i,j] if self[i] + self[j] == 0
      end
    end
    two_sums
  end
end