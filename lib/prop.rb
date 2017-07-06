require 'pry'

class Prop
  @@all = []

  attr_accessor :event_title, :start_time, :sport, :away_team, :home_team, :prop_preview, :team_url

  def initialize(props)
    props.each_with_index do |x, i|
      x[i].each do |attribute, value|
        self.send("#{attribute}=", "#{value}")
        binding.pry
      end
    end
    @@all << self
  end

  def self.generate_props_by_hash(props)
    scrape_site = Scraper.scrape_site
  end

  def self.all
    @@all
  end

end
