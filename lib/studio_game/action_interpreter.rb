require_relative 'die'
require_relative 'player'
require_relative 'playable'
require_relative 'treasure_trove'
require_relative 'action_selector'
require_relative 'action'
require_relative 'game_turn'
require_relative 'game'
require 'pry'

module StudioGame
  class ActionInterpreter
    def interpret_action_input(input, player, players, enemies)
      case input
      when 0
        self.choose_enemy(player, players, enemies)
      when 4
        GameTurn.take_turn(player, players, enemies)
      else
        puts "Please enter a valid option."
        GameTurn.take_turn(player, players, enemies)
      end
    end

    def choose_enemy(player, players, enemies)
      encounter = ActionSelector.new
      puts "confirm selection with '0' or access previous menu with '4'"
      enemy = encounter.get_input
      case enemy
      when 0
        enemies[enemy].blam(enemies[enemy])
      else
        GameTurn.take_turn(player, players, enemies)
      end
    end

    def interpret_heal_input(input, player, players, enemies)
      case input
      when 1
        player.w00t(player)
      when 4
        GameTurn.take_turn(player, players, enemies)
      else
        puts "Please enter a valid option."
        GameTurn.take_turn(player, players, enemies)
      end
    end
  end
end