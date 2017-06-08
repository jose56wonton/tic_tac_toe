require "tic_tac_toe"
describe Game do
  describe ".initialize" do
    context "when it starts a new game" do
      it "creates two player object" do
        expect(Game.new("Bob","Jane").player_one.name).to eql("Bob")
      end
    end
  end
end
