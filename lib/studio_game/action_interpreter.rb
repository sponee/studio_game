require_relative 'die'
require_relative 'player'
require_relative 'treasure_trove'
require_relative 'action_selector'
require_relative 'action'
require_relative 'game_turn'

module StudioGame
  class ActionInterpreter
    def interpret_action_input(input, player)
      case input
      when 1
        player.blam
      when 4
        GameTurn.take_turn(player)
      else
        puts "Please enter a valid option."
        GameTurn.take_turn(player)
      end
    end

    def interpret_heal_input(input, player)
      case input
      when 1
        player.w00t
      when 4
        GameTurn.take_turn(player)
      else
        puts "Please enter a valid option."
        GameTurn.take_turn(player)
      end
    end
  end
end