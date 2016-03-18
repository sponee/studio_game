require_relative 'player'

module StudioGame
  class ClumsyPlayer < Player

    def found_treasure(treasure)
      @found_treasures[treasure.name] += (treasure.points / 2)
      puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
      puts "#{@name}'s treasures: #{@found_treasures}"
    end
  end
end