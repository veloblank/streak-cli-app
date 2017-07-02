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
    number_of_props = @doc.css("div.matchup-container").size
    while i < number_of_props do
      @@prop_keys_array << "Prop_#{i+1}"
       @@prop_hash = {
         event_title: @doc.css("div.matchup-container div.gamequestion strong")[i].text,
         start_time: @doc.css("div.matchupDate")[i].text,
         sport: nil,
         away_team: @doc.css("div #games-content tr td.mg-column3.opponents")[i].text,
         home_team: @doc.css("div #games-content tr td.mg-column3.opponents.last")[i].text,
         prop_preview: @doc.css("div.matchupStatus a")[i].attr("href")}
         team_url = @doc.css("a#matchupDiv.mg-check.mg-checkEmpty.requireLogin")[i]
         partial_url = team_url.attr("href")
         full_url = ESPN + partial_url + "&date=" + "@prop_date"
         if i.even?
           @@prop_hash[:away_team_url] = full_url
         else
           @@prop_hash[:home_team_url] = full_url
         end
    i+=1
    end
  end
  binding.pry
end
