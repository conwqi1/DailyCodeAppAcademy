class Deck
  attr_accessor :cards
  
  def initialize 
    @cards = form_deck 
  end
  
  Cards = {
    :spades => [:Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10,:Jack, :Queen,:King],
    :hearts => [:Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10,:Jack, :Queen,:King],
    :clubs  => [:Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10,:Jack, :Queen,:King],
    :diamonds => [:Ace, 2, 3, 4, 5, 6, 7, 8, 9, 10,:Jack, :Queen,:King],
    :jokers => [:red, :black]
  }
  
  def form_deck
    deck = []
    Cards.each do |kind, val|
      Cards[kind].each do |val|
      deck << [Card.new( kind, val )]
      end
    end
    deck.shuffle
  end
  
  # def shift
  #   cards = []
  #
  #   cards << self.cards.shift
  #
  #   cards
  # end
  
  
end