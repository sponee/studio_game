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
  end
end