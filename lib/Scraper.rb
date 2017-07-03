require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  ESPN = "http://streak.espn.com/en/"
  @@props = []

  def self.scrape
    @doc = Nokogiri::HTML(open(ESPN))
    prop_num = @doc.css("div.matchup-container").size

    i = 0
    while i < prop_num
      event = @doc.css("div.matchup-container div.gamequestion strong")[0].text
      start = @doc.css("div.matchupDate")[0].text
      sport = @doc.css("div.sport-description")[0].text
      away = @doc.css("div #games-content tr td.mg-column3.opponents")[0].text
      home = @doc.css("div #games-content tr td.mg-column3.opponents.last")[0].text
      prop_preview = @doc.css("div.matchupStatus a")[0].attr("href")
      prop = [
        event_title: event,
        start_time: start,
        sport: sport,
        away_team: away,
        home_team: home,
        prop_preview: prop_preview

      ]
        @@props << prop
    i+=1
    end
  end
binding.pry
end

# ].reject {|k,v| k = :sport if @doc.css("div.sport-description").size != prop_num}}
