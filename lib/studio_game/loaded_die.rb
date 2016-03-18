require_relative 'auditable'
require_relative 'die'

module StudioGame
  class LoadedDie < Die
    include Auditable

    def roll
      numbers = [1, 1, 2, 5, 6, 6]
      @number = numbers.sample
      audit
      @number
    end  
  end
end