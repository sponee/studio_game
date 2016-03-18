require_relative 'die'
require_relative 'player'
require_relative 'treasure_trove'

module StudioGame
  module GameTurn
    def self.take_turn(player)
      die = Die.new
      t = StudioGame::TreasureTrove.random
      case die.roll
      when 1..2
        player.blam
      when 3..4
        puts "#{player.name} was skipped."
      else
        player.w00t
      end
      player.found_treasure(t)
    end
  end
end