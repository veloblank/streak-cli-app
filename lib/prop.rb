require 'pry'

class Prop
  @@all = []

  attr_accessor :event_title, :start_time, :sport, :away_team, :home_team, :prop_preview, :away_team_url, :home_team_url

  def initialize(props)
    props.each do |prop|
      binding.pry
      attribute.each do |k, v|
        binding.pry
        self.send("#{k}=", "#{v}")
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
