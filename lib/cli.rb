require 'pry'
require 'colorize'
require 'time'
require 'launchy'

class Cli
  @@user_selections = []

  def run
    Scraper.scrape_page
    Scraper.scrape_props
    Prop.build_props
    self.welcome
    self.print_props
    self.menu
  end

  def welcome
    puts "----------------------------------------------".colorize(:green)
    puts "     Welcome to the DailyStreak Front Page".colorize(:green)
    puts "----------------------------------------------".colorize(:green)
    puts "Here are the Streak props for today..."
    puts ""
    puts ""
    puts
  end

  # if no props have started for the day, this prints a list of all props
  def print_props
    Prop.all_props.each do |prop|
      puts "#{prop.event_title}".colorize(:red)
      puts "#{prop.prop_id_num}. ".colorize(:green) + "#{prop.start_time}   " + "#{prop.sport}   " + "#{prop.away_team}   " + " vs. " + "   #{prop.home_team}"
      puts ""
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Choose a prop you want to see more about:"
      input = gets.strip.downcase
      menu if user_input.to_i > Prop.all_props.size
      case user_input
      when "exit"
        exit
      else
        prop = Prop.all_props[input-1]
        puts "More info on:"
        puts "#{prop.event_title}".colorize(:red)
        puts "#{prop.prop_id_num}. ".colorize(:green) + "#{prop.start_time}   " + "#{prop.sport}   " + "#{prop.away_team}   " + " vs. " + "   #{prop.home_team}"
        puts ""
        puts ""
      end
    end
  end

  def user_selections
    @@user_selections.each do |prop|
      puts "#{prop.event_title}".colorize(:red)
      puts "#{prop.start_time}   " + "#{prop.sport}   " + "#{prop.away_team}   " + " vs. " + "   #{prop.home_team}"
      puts ""
      puts ""
    end
  end
end
