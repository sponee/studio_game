module StudioGame
  Action = Struct.new(:name, :select)
  
  module StudioGame
    module ActionChooser
      OPTIONS = [
        Action.new(:attack, 1),
        Action.new(:heal, 2),
        Action.new(:flee, 3),
      ]

      ATTACK_OPTIONS = [
        Action.new(:confirm, 1),
        Action.new("access last menu", 4)
      ]

      HEAL_OPTIONS = [
        Action.new(:confirm, 1),
        Action.new("access last menu", 4)
      ]
    end
  end
end