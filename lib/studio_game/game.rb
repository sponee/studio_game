require_relative 'player'
require_relative 'game_turn'

module StudioGame
  class Game
    
    attr_accessor :title, :players, :enemies
    
    def initialize(title)
      @title = title
      @players = []
      @enemies = []
    end
    
    def add_player(a_player)
      @players.push(a_player)
    end

    def add_enemy(an_enemy)
      @enemies.push(an_enemy)
    end

    def load_players(from_file)
      File.readlines(from_file).each do |line|
        name, health = line.split(",")
        @players << Player.new(name.to_s, health.to_i)
      end
    end

    def save_high_scores(to_file="high_scores.txt")
      File.open(to_file, "w") do |file|
        file.puts "#{@title} High Scores:"
        @players.sort.each do |player|
          formatted_name = player.name.ljust(20, '.')
          file.puts "#{formatted_name} #{player.score}"
        end
      end
    end
    
    def print_name_and_health(player)
      puts "#{player.name} (#{player.health})"
    end

    def play
      round = 0
      while @enemies.empty? == false
        @players.each do |player|
          round += 1
          puts "\nRound #{round}:"
          GameTurn.take_turn(player, @players, @enemies)
        end
      end
    end

    def summary
      strong, wimpy = @players.partition { |p| p.strong? }
      puts "\n#{title} Statistics:\n"
      puts "\n#{strong.count} strong players:\n"
      strong.each do |s|
        print_name_and_health(s)
      end
      puts "\n#{wimpy.count} wimpy players:\n"
      wimpy.each do |w|
        print_name_and_health(w)
      end
      sorted_players = @players.sort { |x,y| y.score <=> x.score }
      puts "\nHigh Scores:\n"
      sorted_players.each do |p|
        puts "#{p.name.ljust(20, '.')}#{p.score}"
      end
      puts "#{total_points} total points from treasures found"
      @players.each do |p|
        puts "#{p.name}'s total points:\n"
        p.each_found_treasure do |t|
          puts "#{t.points} total #{t.name} points."
        end
        puts "#{p.points} grand total points\n\n"
      end
    end

    def total_points
      @players.reduce(0) { |sum, player| sum + player.points }
    end
  end
end