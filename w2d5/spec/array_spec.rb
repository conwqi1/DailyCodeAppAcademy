require 'rspec'
require 'arrays'

RSpec.describe 'Remove dups' do
  let(:mixed_array) { [1, 2, 1, 3, 3] }
 
  
  describe 'remove dups' do
    it 'removes all the duplicates' do
      expect(mixed_array.my_uniq).should eq([1, 2, 3])
    end
  end
  
  describe 'two sum' do
    let(:zero_sum_array) { [-1, 0, 2, -2, 1] }
    it 'returns the positions of elements that sum to zero' do
      expect(mixed_array.two_sum).should eq([])
      expect(zero_sum_array.two_sum).should eq([[0, 4], [2, 3]])
    end
  end
end


