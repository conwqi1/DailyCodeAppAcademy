require "rspec"
require "Player"

describe Player do
  subject(:player) do
    Player.new("Jack", 200000)
  end
  
  its(:name) {should == "Jack"}
  its(:bankroll) {should == 200000}
  
  describe "pay_winnings" do
    it "adds to winning" do
      player.pay_winnings(200)
      player.bankroll.should == 200200
    end
  end
  
  describe "return_cards" do
    let(:deck) { double("deck") }
    let(:hand) { double("hand", :return_cards => nil) }
    
    before(:each) { player.hand = hand }
    
    it "returns player's cards to the deck" do
      hand.should_receive(:return_cards).with(deck)
      player.return_cards(deck)
    end
    
    it "resets hand to nil" do
      player.return_cards(deck)
      player.hand.should be_nil
    end
  end
  
  describe "place_bet" do
    let(:dealer){double("dealer", :take_bet => nil)} #why not equal sign
    
    it "registers bet with dealer" do
      dealer.should_receive(:take_bet).with(player, 10000)
      player.place_bet(dealer, 10000)
    end
    
    it "deduct bet from bankroll" do
      player.place_bet(dealer, 10000)
      player.bankroll == 190000
    end
    
    it "enforce limits" do
      expect do
        player.place_bet(dealer, 1000000)
    end.to raise_error("player can't cover bet") #change to should and test
   end
  end
  
  
end


