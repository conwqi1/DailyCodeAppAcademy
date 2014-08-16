require_relative 'Deck.rb'
require_relative 'card.rb'

class Hand
  attr_accessor :cards, :deck
  def initialize(deck = Deck.new)
    @cards = []
    @deck = deck.form_deck
  end
  
  def shift(num)
    num.times do
      @cards << @deck.shift
    end
    @cards
  end

   
  def replace(choice1, choice2, choice3)
    choice1 = nil
    choice2 = nil
    choice3 = nil
    choice1 = @deck.shift
    choice2 = @deck.shift
    choice3 = @deck.shift
  end
  
  def fold
    @cards = []
  end
  
  def calculating_pair
  end
  
  def highCard?
    card_values = []
    @cards.each do |card|
      card_values <<  card.value
    end
    card_values.include?(:jack || :queen || :king)
    end
  end
  
  def onePair?
    card_values = []
    @cards.each do |card|
      card_values << card.value
    end
    card_values.uniq.count == card_values.count - 1
  end
  
  def twoPair?
    hashTable = Hash.new{|x,y| x[y] = 0}
    @cards.each do |card|
      hashTable[card.value] += 1
    end
    hashTable.select!{|index,val| val == 2}
    hashTable.count == 2 ? true : false
  end
  
  def three_of_a_kind?
    hashTable = Hash.new{|x,y| x[y] = 0}
    @cards.each do |card|
      hashTable[card.value] += 1
    end
    hashTable.select!{|index,val| val == 3}
    hashTable.count == 1 ? true : false
  end
  
  def straight?
    card_values = []
    @cards.each do |card|
      card_values << card.value
    end
    card_values.sort!
    0.upto(card_value.count -2) do |i|
      j = 1
      return false unless card_value[j] == card_value[i] + 1
      j += 1
   end
   true
  end
  
  def flush?
    card_kinds = []
    cards.each do |card|
      card_kinds << card.kind
    end
    card_kinds.uniq == 1
  end
  
  def full_house?
    onePair? && three_of_a_kind?
  end
    
end