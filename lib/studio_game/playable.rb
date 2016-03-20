module StudioGame
  module Playable

    def blam(enemy)
      self.health -= 10
      puts "#{name} got blammed! #{name} has #{health} hp."
    end
    
    def w00t(player)
      self.health += 15
      puts "#{name} got w00ted!"
    end

    def strong?
      self.health > 100
    end

    def dead?
      self.health <= 0
    end
  end
end