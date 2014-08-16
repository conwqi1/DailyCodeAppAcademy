class TowerofHanoi
  attr_reader :array_1, :array_2, :array_3
  
  def initialize(array_1, array_2 = [], array_3 = [])
    @array_1 = array_1
    @array_2 = array_2
    @array_3 = array_3
  end
  
  def render
    "#{@array_1}, #{@array_2}, #{@array_3}"
  end
  
  def move(from_arr, to_arr)
    item = from_arr.shift
    if to_arr == @array_2
      @array_2 << item # if (to_arr.empty? || to_arr[0] > item)
    end
    render
  end
  
  def won?
    @array1.empty?
  end
    
end