class Mastermind
#  attr_reader :combination

  def self.colors
    ["R", "G", "B", "Y", "O", "P"]
  end
  
  def initialize
      @combination = self.class.colors.shuffle[0..3].join("").downcase
  end
  
  def user_guess
    print "Please enter a four peg guess:"
    gets.chomp.downcase
  end
  
  
  def exact_matches(guess)
    exact_matches = 0
    @combination.length.times do |i|
      if @combination[i] == guess[i]
        exact_matches += 1
      end
    end
  end
  
  def near_matches(guess)
    near_matches = 0
    @combination.length.times do |i|
      if @combination.include?(guess[i]) && @combination[i] != guess[i]
          near_matches += 1
      end
    end
  end
  
  def computer_response(guess)
    if @combination == guess
      "You Win!"
    else
      exact_matches = exact_matches(guess)
      near_matches = near_matches(guess)
      "You have #{exact_matches} exact and #{near_matches} near matches."
    end
  end
  
  def gameplay
    turns = 1
    while turns <= 10 do
      puts "Computer = #{@combination}"
      guess = user_guess
      computer_response = computer_response(guess)
      puts computer_response
      if computer_response == "You Win!"
        break
      elsif turns == 10
        puts "Sorry, you lost the game"
      end
      turns += 1
    end
  end
  
end
