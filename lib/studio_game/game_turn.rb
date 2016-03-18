require_relative 'die'
require_relative 'player'
require_relative 'treasure_trove'
require_relative 'action_selector'
require_relative 'action'

module StudioGame
  module GameTurn
    def self.take_turn(player)
      encounter = ActionSelector.new
      t = StudioGame::TreasureTrove.random
      encounter.print_options
      input = encounter.get_input
      case input
      when 1
        player.blam
      when 2
        player.w00t
      else
        puts "#{player.name} was skipped."
      end
      player.found_treasure(t)
    end
  end
end