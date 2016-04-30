require_relative 'player'
require_relative 'game_turn'
require 'pry'

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

    def party_info(party)
      puts "Name - Health - Stamina"
      party.each do |player|
        puts "#{player.name} - #{player.health} - #{player.stamina}"
      end
    end

    def kick_dead_players(characters)
      characters.each_with_index do |p, index|
        if p.dead?
          @players.delete_at(index)
          puts "#{p.name} died and was kicked from the party."
        end
      end
    end

    def kick_dead_enemies(characters)
      characters.each_with_index do |p, index|
        if p.dead?
          @enemies.delete_at(index)
          puts "#{p.name} died and was kicked from the party."
        end
      end
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
      puts "\nPlayer Party Info:"
      party_info(@players)
      puts "\nEnemy Party Info:"
      party_info(@enemies)
      sorted_players = (@players + @enemies).sort { |x,y| y.stamina <=> x.stamina }
      while @players.count >= 1 && @enemies.count >= 1
        sorted_players.each_with_index do |player, index|
          if player.dead? && player.enemy == 'T' && @enemies.count <= 1
            @enemies.delete_at(0)
            sorted_players.delete_at(index)
            kick_dead_enemies(@enemies)
            puts "You have slain the enemy party."
            exit
          elsif player.dead? && player.enemy == 'F' && @players.count <= 1
            @players.delete_at(index)
            sorted_players.delete_at(index)
            kick_dead_players(@players)
            puts "You have slain been slain by the enemy party."
            exit
          elsif player.dead? && player.enemy == 'T' && @enemies.count > 1
            @enemies.delete_at(0)
            sorted_players.delete_at(index)
            puts "#{player.name} has been slain."
          elsif player.dead? && player.enemy == 'F' && @players.count > 1 
            @players.delete_at(0)
            sorted_players.delete_at(index)
            puts "#{player.name} has been slain."
          else
            round += 1
            puts "\nRound #{round}:"
            GameTurn.take_turn(player, @players, @enemies)
          end
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
      sorted_players = @players.sort { |x,y| y.stamina <=> x.stamina }
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