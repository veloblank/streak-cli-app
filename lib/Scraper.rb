require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  ESPN = "http://streak.espn.com/en/"
  @@all_props = {}
  @@prop_key_titles = []
  @doc = Nokogiri::HTML(open(ESPN))

  def self.scrape
    number_of_props = @doc.css("div.matchup-container").size
    prop_num = @doc.css("div.matchup-container").size
    prop_key = Array.new(prop_num, "Prop_")

    prop_key.each.with_index(1) do |prop, i|
        @@prop_key_titles << "#{prop}"+"#{i}"
        @@all_props = {
        @@prop_key_titles[i-1] => {
          event_title: @doc.css("div.matchup-container div.gamequestion strong")[0].text,
          start_time: @doc.css("div.matchupDate")[0].text,
          sport: @doc.css("div.sport-description")[0].text,
          away_team: @doc.css("div #games-content tr td.mg-column3.opponents")[0].text,
          home_team: @doc.css("div #games-content tr td.mg-column3.opponents.last")[0].text,
          prop_preview: @doc.css("div.matchupStatus a")[0].attr("href")
       }.reject {|k,v| k = :sport if @doc.css("div.sport-description").size != number_of_props}}
    end
  end
  binding.pry
end



# prop_title_count = "Prop_#{z}"
