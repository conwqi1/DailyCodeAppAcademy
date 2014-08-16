require 'rspec'
require 'Hand'
require 'card'
require 'Deck'

# The logic of calculating pair, three-of-a-kind, two-pair, etc. goes here.
# Logic of which hand beats which would go here.

RSpec.describe Hand do
  
  Deck_cards = [
    Card.new(:hearts, 10),
    Card.new(:spades, 2),
    Card.new(:clubs, 8),
    Card.new(:hearts, :queen),
    Card.new(:clubs, 4)
  ]
  
  describe "method shift" do
    it "deals a hand of five cards" do
      hand = Hand.new
      hand.should_receive(:shift).with(5)
      hand.shift(5)
    end
    
    it "receive five cards on hand" do
      hand = Hand.new
      hand.shift(5)
      expect(hand.cards.count).to eq(5)
    end
  end
  
  describe "method fold" do
    it "return the cards to the dealer" do
      hand = Hand.new
      hand.fold
      expect(@cards).to eq(nil)
    end
    
    it "fold called on Hand" do
      hand = Hand.new
      expect(hand).to receive(:fold)
      hand.fold
    end
      
  end
    
  
end

describe Deck do

  it "should start with 54 cards" do
    deck = Deck.new.form_deck
    deck.count.should eq(54)
  end
end

