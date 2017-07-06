require 'pry'
require 'colorize'

class Cli

  def run
    @props = Scraper.get_page
    Prop.new(@props)
    self.welcome
  end

  def welcome
    puts "----------------------------------------------".colorize(:green)
    puts "     Welcome to the DailyStreak Front Page".colorize(:green)
    puts "----------------------------------------------".colorize(:green)
    puts "Here are the #{@props.size} Streak props for today..."
    puts ""
    puts ""
    binding.pry
  end

end
