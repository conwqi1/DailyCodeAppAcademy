class RPN
  def initialize
    @arr=[]
  end
  
  def current
    @arr.last
  end
  
  def clear
    @arr = []
  end
  
  def calculation input
       input.each do |el|
      
         if el=="+"
           @arr << @arr.pop + @arr.pop 
         elsif el=="-"
           number = @arr.pop
           @arr << @arr.pop - number
         elsif el=="*"
           @arr << @arr.pop * @arr.pop
         elsif el=="/"
           number = @arr.pop
           @arr << @arr.pop / number
         else
           @arr << el.to_i
         end
       end  
       
      @arr
  end
  
  def user_input
    puts "enter Rpn notation:"
    while true
      self.calculation([ gets.chomp ])
      puts self.current
    end
  end
  
  def readfile filename = "RpnCalculator.txt"
    calculation=[]
    calculation = File.read(filename).chomp.split(' ')
    calculation
  end
end

if __FILE__ == $PROGRAM_NAME 
  calc = RPN.new
  calc.calculation(calc.readfile)
  puts calc.current
  
  calc.clear
  calc.user_input
end
  