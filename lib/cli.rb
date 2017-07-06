require 'pry'

class Cli

  def run
    self.scrape_site
    self.prep_prop_info

  end

  def scrape_site
    puts "----------------------------------------------"
    puts "     Welcome to the DailyStreak Front Page"
    puts "----------------------------------------------"
    puts "Here are the Streak props for today..."
    puts ""

  end

  def prep_prop_info

  end

end
