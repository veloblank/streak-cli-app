require 'pry'
require 'colorize'
require 'time'
require 'launchy'

class Cli

  def run
    Scraper.get_page
    Prop.build_props
    self.welcome
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
end
