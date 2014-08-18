require_relative 'player'
require_relative 'deck'
require_relative 'dealer'
require_relative 'hand'

class Game
  attr_reader :players, :deck, :dealer

  def initialize
    @players = []
    @deck = Deck.new
    @dealer = Dealer.new
  end

  def play
    @deck.shuffle
    number_of_players
    place_bet
    dealer_hand
    player_hand
    dealer_turn
    play_return_cards
  end

  def game_over?
    @player.count == 0
  end
  
  
  def place_bet
    @players.each do |player|
      puts "enter bet amount for #{player.name}"
      bet_amt = gets.chomp.to_i
      player.place_bet(@dealer, bet_amt)
    end
  end

  def add_players
    puts "enter the name of the player"
    name = gets.chomp
    puts "enter the bankroll for #{name}"
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

  def dealer_hand
    @dealer.hand = Hand.deal_from(@deck)
    puts "dealer's cards are: " + "#{dealer.hand.cards[0]}"+"*"
  end

  def player_hand
    @players.each do |player|
      puts "#{player.name}"
      player.hand = Hand.deal_from(@deck)
      puts "your cards are: " + "#{player.hand.to_s}"
    end
    @players.each do |player|
      player_move(player)
    end
  end

  def player_move(player)
    puts "#{player.name}" + "enter h or s for hit or stand"
    move = gets.chomp
    if move == "s"
      puts "#{player.name}" + ":" "#{player.hand.to_s}"
      puts "#{player.name}" + "chose to stay"
    else
      player.hand.hit(@deck)
      puts "#{player.name}" + ":" "#{player.hand.to_s}"
      if player.hand.busted?
        puts "#{player.name}" +": busted" 
      else
        player_move(player) 
      end
    end
  end

  def dealer_turn
    @dealer.play_hand(@deck)
    @dealer.pay_bets
    @dealer.return_cards(@deck)
  end

  def play_return_cards
      @players.each do |player|
        player.return_cards(@deck)
      end
  end
    
  
end


