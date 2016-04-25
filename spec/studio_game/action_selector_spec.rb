require 'studio_game/action_selector'
require 'studio_game/game'

module StudioGame
  describe ActionSelector do
    
    before(:each) do
      @encounter = ActionSelector.new
      @game = Game.new("Knuckleheads")
      @initial_health = 100
      @player1 = Player.new("alex", @initial_health)
      @player2 = Player.new("kyle", @initial_health)
      @enemy1 = Player.new("jay", 25)
      @enemy2 = Player.new("diego", 25)
      @game.add_player(@player1)
      @game.add_player(@player2)
      @game.add_enemy(@enemy1)
      @game.add_enemy(@enemy2)
    end
    
    it "prints an array of options." do
      expect(@encounter.print_options.class).to eq(Array)
    end

    it "prints an attack option at the 0th index" do
      expect(@encounter.print_options[0].name.to_s).to eq('attack')
    end

    it "prints a heal option at the 1st index" do 
      expect(@encounter.print_options[1].name.to_s).to eq('heal')
    end

    it "prints a flee option at the 2nd index" do
      expect(@encounter.print_options[2].name.to_s).to eq('flee')
    end

    it "prints each enemy player as an attack option" do
      expect(@encounter.print_attack_options(@game.enemies).class).to eq(Array)
    end

  end
end