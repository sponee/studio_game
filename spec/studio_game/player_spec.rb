require 'studio_game/player'
require 'studio_game/treasure_trove'

module StudioGame
  describe Player do 

    before(:each) do
      @player = Player.new("kyle")
      @enemy = Player.new("enemy, 60")
      @initial_health = 60
    end

    it "has a capitalized name" do
      expect(@player.name).to eq("Kyle")
    end

    it "has initial health" do
      expect(@player.health).to eq(@initial_health)
    end

    it ".to_s prints a sentence" do
      expect(@player.to_s).to eq("Kyle with a health of 60.")
    end

    it ".score = name.count + health" do
      expect(@player.score).to eq(60)
    end

    it ".woot += 15 health" do
      @player.w00t(@player)
      expect(@player.health).to eq(@initial_health + 15)
    end

    it ".blam -= 10 health" do
      @enemy.blam(@enemy)
      expect(@enemy.health).to eq(60 - 10)
    end

    it "computes a score as the sum of its health and points" do
      @player.found_treasure(Treasure.new(:hammer, 50))
      @player.found_treasure(Treasure.new(:hammer, 50))

      expect(@player.score).to eq(160)
    end
  end

    context "with health above 150" do
      before(:context) do
        @player = Player.new("joe", 150)
      end

      it "is strong" do
        expect(@player.strong?).to eq(true)
      end

      it "has higher health in this context" do
        expect(@player.health).to eq(150)
      end

      it "has a different name that is still capitalized in this context" do
        expect(@player.name).to eq("Joe")
      end

    context "with health below 100" do
      before(:context) do
        @player = Player.new("alex", 100)
      end
      
      it "is not strong" do
        expect(@player.strong?).to eq(false)
      end
    end

    context "in a collection of players" do
      before do
        @player1 = Player.new("moe", 100)
        @player2 = Player.new("larry", 200)
        @player3 = Player.new("curly", 300)

        @players = [@player1, @player2, @player3]
      end

      it "is sorted by decreasing score" do
        expect(@players.sort).to eq([@player3, @player2, @player1])
      end
    end

    it "yields each found treasure and its total points" do
      @player.found_treasure(Treasure.new(:skillet, 100))
      @player.found_treasure(Treasure.new(:skillet, 100))
      @player.found_treasure(Treasure.new(:hammer, 50))
      @player.found_treasure(Treasure.new(:bottle, 5))
      @player.found_treasure(Treasure.new(:bottle, 5))
      @player.found_treasure(Treasure.new(:bottle, 5))
      @player.found_treasure(Treasure.new(:bottle, 5))
      @player.found_treasure(Treasure.new(:bottle, 5))

      yielded = []
      @player.each_found_treasure do |treasure|
        yielded << treasure
      end

      expect(yielded).to eq([
        Treasure.new(:skillet, 200),
        Treasure.new(:hammer, 50),
        Treasure.new(:bottle, 25)
     ])
    end
  end
end