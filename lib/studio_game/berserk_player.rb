require_relative 'player'

  module StudioGame
  class BerserkPlayer < Player

    def initialize(name, health=60)
      @woots = 0
      super(name, health)
    end

    def berserk?
      @woots > 5
    end

    def w00t(player)
      super
      @woots += 1
      puts "#{@name} is berserk!" if berserk?
    end

    def blam(enemy)
      case berserk?
      when false
        super
      else
        w00t(@player)
      end
    end
  end
end