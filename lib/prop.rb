require 'pry'

class Prop
  @@all = []

  attr_accessor :event_title, :start_time, :sport, :away_team, :home_team, :prop_preview, :away_team_url, :home_team_url

  def initialize(prop)
    prop.each do |k, v|
      self.send("#{k}=", "#{v}")
    end
    @@all << self
  end

  def self.generate_props_by_hash(props_hash)
    Scraper.scrape_team_urls
    props_hash.each_with_index do |prop, i|
      prop[:away_team_url] = Scraper.away_team_urls[i]
      prop[:home_team_url] = Scraper.home_team_urls[i]
      Prop.new(prop)
    end
  end

  def self.all
    @@all
  end
end
