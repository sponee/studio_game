module StudioGame
  Action = Struct.new(:name, :select)
  
  module StudioGame
    module ActionChooser
      OPTIONS = [
        Action.new(:attack, 1),
        Action.new(:heal, 2),
        Action.new(:flee, 3),
        Action.new("access last menu", 4),
      ]
    end
  end
end