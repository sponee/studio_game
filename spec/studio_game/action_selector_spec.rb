require 'studio_game/action_selector.rb'

module StudioGame
  describe ActionSelector do
    
    before do 
      @encounter = ActionSelector.new
      @encounter.print_options("Attack, Heal, or Flee?", ['attack', 'heal', 'flee'])
    end

    it "prints an option with an index" do
      expect(@encounter.print_options("Attack", ['attack'])).to eq(["attack"])
    end
  end
end