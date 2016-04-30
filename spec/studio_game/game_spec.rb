require 'studio_game/game'

module StudioGame
  describe Game do

    before(:each) do
      @game = Game.new("Knuckleheads")
      @initial_health = 100
      @player1 = Player.new("alex", @initial_health, 25, 'F')
      @player2 = Player.new("kyle", @initial_health, 25, 'F')
      @enemy1 = Player.new("jay", 25, 25, 'T')
      @enemy2 = Player.new("diego", 25, 25, 'T')
      @game.add_player(@player1)
      @game.add_player(@player2)
      @game.add_enemy(@enemy1)
      @game.add_enemy(@enemy2)
    end
    
    it "has a title" do
      expect(@game.title).to eq("Knuckleheads")
    end

    it "has two player characters" do
      expect(@game.players.count).to eq(2)
    end

    it "has two enemy characters" do
      expect(@game.enemies.count).to eq(2) 
    end

    it "computes total points as the sum of all player points" do

      @player1.found_treasure(Treasure.new(:hammer, 50))
      @player1.found_treasure(Treasure.new(:hammer, 50))
      @player2.found_treasure(Treasure.new(:crowbar, 400))

      expect(@game.total_points).to eq(500)
    end

#    it "is over if the player party is empty" do
#      @game.players.delete_at(0)
#      @player2.health = -5
#      @player2.stamina = 0
#      expect(@game.play).to eq("You have been slain by the enemy party.")
#    end
  end
end