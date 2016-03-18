module StudioGame

  class ActionSelector

    def get_input
      action = gets.chomp.to_i
    end

    def print_options(text, actions)
      puts text
      actions.each_with_index do |action, index|
        puts "\nPress #{index} to #{action}"          
      end
    end
  end
end