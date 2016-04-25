require 'studio_game/action_interpreter'
require 'studio_game/game'
require 'pry'

module StudioGame
  describe ActionInterpreter do
    
    before(:each) do
      $stdin = StringIO.new("0")
      @encounter = ActionSelector.new
      @interpreter = ActionInterpreter.new
      @game = Game.new("Knuckleheads")
      @initial_health = 100
      @player1 = Player.new("alex", @initial_health, 25)
      @player2 = Player.new("kyle", @initial_health, 25)
      @enemy1 = Player.new("jay", @initial_health, 25)
      @enemy2 = Player.new("diego", @initial_health, 25)
      @game.add_player(@player1)
      @game.add_player(@player2)
      @game.add_enemy(@enemy1)
      @game.add_enemy(@enemy2)
    end

    after(:each) do
      $stdin = STDIN
    end

    it "confirms enemy choice and blams the enemy upon confirmation." do 
      @interpreter.choose_enemy(@player1, @game.players, @game.enemies)
      expect(@enemy1.health).to eq(90)
    end

    it "confirms the user wants to heal and w00ts the current player." do
      @interpreter.interpret_heal_input(1, @player1, @game.players, @game.enemies)
      expect(@player1.health).to eq(115)
    end
  end
end