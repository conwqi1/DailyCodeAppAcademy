class GuessingGame
  attr_reader :number, :guesses
  
  def initialize
    @number = rand(1..100)
    @guesses = 0
  end
  
  def compare guess
    if guess > number
      puts "too high"
    elsif guess < number
      puts "too low"
    else
      puts "you win"
      exit
    end
  end
  
  def prompt_for_guess 
    puts "Enter a number:"
    guess = gets.chomp.to_i
  end
  
  def run_game
    while true
      guess = self.prompt_for_guess
      self.compare(guess)
    end
  end
end

newgame=GuessingGame.new
newgame.run_game