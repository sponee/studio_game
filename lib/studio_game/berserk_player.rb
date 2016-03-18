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

    def w00t
      super
      @woots += 1
      puts "#{@name} is berserk!" if berserk?
    end

    def blam
      case berserk?
      when false
        super
      else
        w00t
      end
    end
  end
end