require_relative 'playable'

module StudioGame
  class Player
    include Playable

    attr_accessor :name, :found_treasures, :health, :stamina, :enemy

    def initialize(name, health=60, stamina=50, enemy)
      @name = name.capitalize
      @health = health
      @stamina = stamina
      @found_treasures = Hash.new(0)
      @enemy = enemy
    end
    
    def to_s
      "#{@name} with a health of #{@health}."
    end
    
    def score
      @health + points
    end

    def <=>(other)
      other.stamina <=> stamina
    end

    def points
      @found_treasures.values.reduce(0, :+)
    end

    def found_treasure(treasure)
      @found_treasures[treasure.name] += treasure.points
      puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
      puts "#{@name}'s treasures: #{@found_treasures}"
    end

    def each_found_treasure
      @found_treasures.each do |name, points|
        treasure = Treasure.new(name, points)
        yield treasure
      end
    end
  end
end

if __FILE__ == $0
  player = Player.new("moe")
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end