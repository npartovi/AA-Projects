require 'rspec'
require 'towers'

RSpec.describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }


  describe "#initialize" do
    let(:tower1) {game.towers[0]}
    it "iniitalizes an instance variable @towers to be length three" do
      expect(tower1.length).to eq(3)
    end

    it "initializes @towers[0] to be [1, 2, 3]" do
      expect(tower1).to match_array([3, 2, 1])
    end
  end

  describe "#move" do
    let(:disc) {game.towers[0].last}

    before(:each) do
      game.move(0,1)
    end

    it "pops disc off from first tower" do
      expect(game.towers[0]).to eq([3,2])
    end

    it "pushes disc onto tower" do
      expect(game.towers[1]).to eq([1])
    end
end


  describe "#won?" do
     before(:each) do
        game.move(0,1)
        game.move(0,2)
        game.move(1,2)
        game.move(0,1)
        game.move(2,0)
        game.move(2,1)
        game.move(0,1)
      end

    it "check if towers 2 or 3 contains all 3 discs" do
      expect(game.won?).to be_truthy
    end
  end
end
