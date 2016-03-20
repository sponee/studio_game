require 'studio_game/game'

module StudioGame
  describe Game do

    before(:each) do
      @game = Game.new("Knuckleheads")
      @initial_health = 100
      @player = Player.new("moe", @initial_health)
      @player = Player.new("foe", 25)
      @game.add_player(@player)
      @game.add_enemy(@enemy)
    end
    
    it "has a title" do
      expect(@game.title).to eq("Knuckleheads")
    end

    it "has one player character" do
      expect(@game.players.count).to eq(1)
    end

    it "has one enemy character" do
      expect(@game.enemies.count).to eq(1) 
    end

#    it "assigns a treasure for points during a player's turn" do
#      game = Game.new("Knuckleheads")
#      player = Player.new("moe")
#      game.add_player(player)
#      game.play(1)
#      
#      expect(player.points).not_to be_zero
#    end
#    
#    it "w00ts the player if a high number is rolled" do
#      allow_any_instance_of(Die).to receive(:roll).and_return(5)
#      @game.play(1)
#      expect(@player.health).to eq(@initial_health + 15)
#    end
#    
#    it "skips the player if a medium number is rolled" do
#      allow_any_instance_of(Die).to receive(:roll).and_return(3)
#      @game.play(1)
#      expect(@player.health).to eq(@initial_health)
#    end
#    
#    it "blams the player if a low number is rolled" do
#      allow_any_instance_of(Die).to receive(:roll).and_return(1)
#      @game.play(1)
#      expect(@player.health).to eq(@initial_health - 10)
#    end

    it "computes total points as the sum of all player points" do
      game = Game.new("Knuckleheads")

      player1 = Player.new("moe")
      player2 = Player.new("larry")

      game.add_player(player1)
      game.add_player(player2)

      player1.found_treasure(Treasure.new(:hammer, 50))
      player1.found_treasure(Treasure.new(:hammer, 50))
      player2.found_treasure(Treasure.new(:crowbar, 400))

      expect(game.total_points).to eq(500)
    end
  end
end