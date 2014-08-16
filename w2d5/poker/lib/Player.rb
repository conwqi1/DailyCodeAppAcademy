require "rspec"

class Player
  attr_reader :name, :bankroll
  # Hand object is defined elsewhere
  attr_accessor :hand
  
  def initialize(name, bankroll)
    @name = name
    @bankroll = bankroll
  end
  
  def pay_winnings(winning_amount)
    @bankroll += winning_amount
  end
  
  def return_cards(deck)
    hand.return_cards(deck)
    @hand = nil
  end
  
  def place_bet(dealer, bet_amount)
    raise "player can't cover bet" if bet_amount > @bankroll
    @bankroll -= bet_amount
    #register with dealer
  end
  
end