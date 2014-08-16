require "rspec"
require "tower_of_hanoi"

RSpec.describe 'tower_of_hanoi' do
  let(:array_1) { [1, 2, 3, 4, 5, 6, 7] }
  let(:array_2) { [ ] }
  let(:array_3) { [ ] }
  let(:game) { TowerofHanoi.new(array_1)}
  
  describe "initialize" do
    it "should set up the game arrays" do
       expect (game.array_1).should eq([1, 2, 3, 4, 5, 6, 7])
    end
  end
  
  describe "render the game" do
    it "should show all arrays" do
      expect(game.render).should eq("[1, 2, 3, 4, 5, 6, 7], [], []")
    end
  end
  
  describe "move" do 
    it "should move a disk from one array to another array" do
      expect(game.move(array_1, array_2)).should eq("[2, 3, 4, 5, 6, 7], [1], []")
    end
  end
  
  describe "won" do
    context "should return true when win the game" do
      before(:each) do
        game.move(array_1, array_2)
        game.move(array_1, array_2)
        game.move(array_1, array_2)
        game.move(array_1, array_2)
        game.move(array_1, array_2)
        game.move(array_1, array_2)
        game.move(array_1, array_2)     
      end
    
    it "should return true" do
      expect(game.won?).to eq(true )
    end
  end
end

end