require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  ESPN = "http://streak.espn.com/en/entry?date=20170702"
  @@prop_hash = {}
  @@prop_keys_array = []
  @doc = Nokogiri::HTML(open(ESPN))

  attr_accessor :number_of_props, :prop_keys_array

  def self.scrape
    i = 0
    z = 1
    number_of_props = @doc.css("div.matchup-container").size
    while i <= number_of_props do
       @@prop_keys_array << "Prop_#{z}"
       @@prop_hash = {
         event_title: @doc.css("div.matchup-container div.gamequestion strong")[0].text,
         start_time: @doc.css("div.matchupDate")[0].text,
         sport: @doc.css("div.sport-description")[0].text,
         away_team: @doc.css("div #games-content tr td.mg-column3.opponents")[0].text,
         home_team: @doc.css("div #games-content tr td.mg-column3.opponents.last")[0].text,
         prop_preview: @doc.css("div.matchupStatus a")[0].attr("href")
       }.reject {|k,v| k = :sport if @doc.css("div.sport-description").size != number_of_props}
         binding.pry
      z+=1
      i+=1
    end
  end
  binding.pry
end
