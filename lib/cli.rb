require 'pry'
require 'colorize'
require 'time'
require 'launchy'

class Cli

  def run
    Scraper.scrape_page
    Scraper.scrape_props
    Prop.build_props
    self.welcome
    self.print_props
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

  def print_props
    Prop.all_props.each do |prop|
      puts "#{prop.event_title}".colorize(:red)
      puts "#{prop.prop_id_num}. ".colorize(:green) + "#{prop.start_time}   " + "#{prop.sport}   " + "#{prop.away_team}   " + " vs. " + "   #{prop.home_team}"
      puts ""
      end
    end
end
