require_relative 'player'
require_relative 'deck'
require_relative 'dealer'

class Game
  attr_reader :players, :deck

  def initialize
    @players = []
    @deck = Deck.new
    @dealer = Dealer.new
  end

  def play
    @deck.shuffle
    number_of_players
    place_bet
  end

  def game_over?
    @player.count == 0
  end
  
  def deal_cards
    
  end
  
  def place_bet
    @players.each do |player|
      puts "enter bet amount"
      bet_amt = gets.chomp.to_i
      player.place_bet("dealer", bet_amt)
    end
  end

  def add_players
    puts "enter the name of the player"
    name = gets.chomp
    puts "enter the bankroll"
    bankroll = gets.chomp.to_i
    @players << Player.new(name, bankroll)
  end
  
  def number_of_players
    puts "the number of players"
    num = gets.chomp.to_i
    num.times do
      add_players
    end
  end
  
end


