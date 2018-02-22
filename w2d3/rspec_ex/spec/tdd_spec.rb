require 'rspec'
require 'tdd'

RSpec.describe "TDD" do
  describe "#my_uniq" do
    it "removes duplicates" do
      expect([1, 1, 2, 2, 3, 3].my_uniq).to eq([1,2,3])
    end
  end

  describe "#two_sum" do
    it "finds two pairs that sum to zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do
    it "transposes an array" do
      original =
        [[0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]]


      transposed =
        [[0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]]
      expect(my_transpose(original)).to eq(transposed)
    end
  end

  describe "#stock_picker"  do

    context "when bull market" do
      it "finds most profitable day" do
        prices = [10, 12, 14, 9, 10]
        expect(stock_picker(prices)).to eq([0, 2])
      end
    end

    context "when bear market" do
        it "finds most profitable day" do
          prices = [10, 9, 7, 4, 1]
          expect(stock_picker(prices)).to eq([0, 1])
        end

        it "finds most profitable day if its not the first 2 days" do
          prices = [10,7,6,4,2,0]
          expect(stock_picker(prices)).to eq([1,2])
        end
      end

  end

end
