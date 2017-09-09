require 'nokogiri'
require 'open-uri'
require 'time'
require 'pry'

class Scraper
  ESPN = "http://streak.espn.com/en/"

  def self.get_page
    @doc = Nokogiri::HTML(open(ESPN))
    @@scraped_props = @doc.css("div .matchup-container")
  end

  def self.all_props
    @@scraped_props
  end
end
