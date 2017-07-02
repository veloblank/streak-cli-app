require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  ESPN = "http://streak.espn.com/en/"
  @doc = Nokogiri::HTML(open(ESPN))

  def self.scrape
    @@all_props = {}
    @@prop_key_titles = []
    number_of_props = @doc.css("div.matchup-container").size
    prop_num = @doc.css("div.matchup-container").size
    prop_key = Array.new(prop_num, "Prop_")
    binding.pry
    prop_key.each.with_index(1) do |prop, i|
      @@prop_key_titles << "#{prop}"+"#{i}"
    end

      prop = @@prop_key_titles.each_with_index.map do |title, i|
      @@all_props = {
           "#{title}" => {
          event_title: @doc.css("div.matchup-container div.gamequestion strong")[i].text,
          start_time: @doc.css("div.matchupDate")[i].text,
          sport: @doc.css("div.sport-description")[i].text,
          away_team: @doc.css("div #games-content tr td.mg-column3.opponents")[i].text,
          home_team: @doc.css("div #games-content tr td.mg-column3.opponents.last")[i].text,
          prop_preview: @doc.css("div.matchupStatus a")[i].attr("href")
       }.reject {|k,v| k = :sport if @doc.css("div.sport-description").size != number_of_props}}
      end
  end
  binding.pry
end

#I am close to being finished with the scraper. I have had a lot of learn-on-the-fly moments--
#with trying to remember hashes, how to write to them without overwriting their info, etc.

#I think this is my problem now. The last pry showed it arrived at prop 21 with all the right info intact,
#but not in a large nested array. I will tackle this later and move to the Prop class.

#Got it!!!!!!

#All 21 props but information is a little wonky.
