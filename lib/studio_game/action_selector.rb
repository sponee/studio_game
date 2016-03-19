require_relative 'action'

module StudioGame

  class ActionSelector

    def get_input
      action = gets.chomp.to_i
    end

    def print_options(options=StudioGame::ActionChooser::OPTIONS)
      options.each do |option|
        puts "Press #{option.select} to #{option.name}"          
      end
    end
  end
end

#encounter = StudioGame::ActionSelector.new
#encounter.print_options