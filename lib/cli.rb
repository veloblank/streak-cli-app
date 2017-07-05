require 'pry'

class Cli
  

  def run
    self.scrape_site
    self.prep_prop_info

  end

  def scrape_site
    puts "Here are the Streak props for today..."
    Prop.generate_props(Scraper.get_page)
  end

  def prep_prop_info

  end
binding.pry
end
