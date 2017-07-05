require 'pry'

class Prop
  @@all = []

  attr_accessor :event_title, :start_time, :sport, :away_team, :home_team, :prop_preview

  def initialize(daily_props)
    daily_props.each do |attribute, value|
      self.send("#{attribute}=", "#{value}")
    end
    @@all << self
  end

  def generate_props
    scrape_site = Scraper.scrape_site
binding.pry
  end

  def self.all
    @@all
  end

binding.pry
end
