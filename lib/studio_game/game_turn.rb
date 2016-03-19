require_relative 'die'
require_relative 'player'
require_relative 'treasure_trove'
require_relative 'action_selector'
require_relative 'action'
require_relative 'action_interpreter'

module StudioGame
  module GameTurn
    def self.take_turn(player)
      puts "#{player.name}'s turn:"
      encounter = ActionSelector.new
      t = StudioGame::TreasureTrove.random
      i = ActionInterpreter.new
      encounter.print_options
      input = encounter.get_input
      case input
      when 1
        encounter.print_options(StudioGame::ActionChooser::ATTACK_OPTIONS)
        i.interpret_action_input(encounter.get_input, player)
      when 2
        encounter.print_options(StudioGame::ActionChooser::HEAL_OPTIONS)
        i.interpret_heal_input(encounter.get_input, player)
      else
        puts "#{player.name} fled."
      end
    end
  end
end